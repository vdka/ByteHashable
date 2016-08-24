# ByteHashable

Because making Plain Old Data types equatable is ussually just boilerplate that I am sick of writing.

Makes conformance to `Equatable` and `Hashable` as simple as 

```swift
extension Vector2: ByteHashable {}
```

:tada: Now you can compare and hash your Vectors to your hearts content.

### Note
This will only work on non reference types, reference types store a pointer (memory address) in the memory I inspect therefore hashing them will be more of a hash of their identity, so be careful.
