# NoOptionalInterpolation

[![Version](https://img.shields.io/cocoapods/v/NoOptionalInterpolation.svg?style=flat)](http://cocoapods.org/pods/NoOptionalInterpolation)
[![License](https://img.shields.io/cocoapods/l/NoOptionalInterpolation.svg?style=flat)](http://cocoapods.org/pods/NoOptionalInterpolation)
[![Platform](https://img.shields.io/cocoapods/p/NoOptionalInterpolation.svg?style=flat)](http://cocoapods.org/pods/NoOptionalInterpolation)

## Description

NoOptionalInterpolation gets rid of "Optional(...)" and "nil" in Swift's string interpolation.

Example:

```swift
let n:Int? = 1
let t:String? = nil
let s:String? = "string"
let o:String?? = "nested optionals"

let i = "\(n) \(t) \(s) \(o)"
print(i)
```

Without NoOptionalInterpolation:
```
Optional(1) nil Optional("string") Optional(Optional("nested optionals"))
```

With NoOptionalInterpolation:
```
1  string nested optionals
```

## Installation

NoOptionalInterpolation is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NoOptionalInterpolation"
```

and the following line to your project's Bridging-Header.h file:
```objective-c
@import NoOptionalInterpolation;
```

## License

NoOptionalInterpolation is available under the MIT license. See the LICENSE file for more info.
