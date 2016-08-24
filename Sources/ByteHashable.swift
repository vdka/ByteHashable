
public
func hashMemory<T>(of input: T) -> Int {

  // make a copy beacuse we *might* mutate input when getting an UnsafePointer to the value. Dammit. That sucks.
  //  *should* be no cost provided the compiler sees we are not actually mutating the value in there. But it sure
  //  would be nice to have a way to tell the compiler I would like to just *look* at the memory.
  var input = input

  return withUnsafePointer(to: &input) { pointer in

    // transform the pointer into a byte pointer
    let firstByte = unsafeBitCast(pointer, to: UnsafePointer<UInt8>.self)

    // transform bytePointer into a buffer pointer
    let bytes = UnsafeBufferPointer(start: firstByte, count: MemoryLayout<T>.size)

    // Hash using `One at a time`
    // http://eternallyconfuzzled.com/tuts/algorithms/jsw_tut_hashing.aspx#oat
    var h = 0
    for byte in bytes {
      h = h &+ numericCast(byte)
      h = h &+ (h << 10)
      h ^= (h >> 6)
    }

    h = h &+ (h << 3)
    h ^= (h >> 11)
    h = h &+ (h << 15)

    return h
  }
}

public protocol ByteHashable: Hashable { }

extension ByteHashable {

  public var hashValue: Int {
    return hashMemory(of: self)
  }

  public static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.hashValue == rhs.hashValue
  }
}

