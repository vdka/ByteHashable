# ByteHashable

Because making Plain Old Data types equatable is ussually just boilerplate that I am sick of writing.

Makes conformance to `Equatable` and `Hashable` as simple as

```swift
extension Vector2: ByteHashable {}
```

:tada: Now you can compare and hash your Vectors or anything else to your hearts content.

### SwiftPM
```
.Package(url: "https://github.com/vdka/ByteHashable.git", majorVersion: 1),
```

### Note
This will only work correctly on Plain Old Data types. Any instance variable that store pointers to their data (`String`, `Array` ...) will instead be checked for identity instead of eqaulity.

