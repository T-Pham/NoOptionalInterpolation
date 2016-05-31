# NoOptionalInterpolation

[![CI Status](http://img.shields.io/travis/T-Pham/NoOptionalInterpolation.svg?style=flat)](https://travis-ci.org/T-Pham/NoOptionalInterpolation)
[![Version](https://img.shields.io/cocoapods/v/NoOptionalInterpolation.svg?style=flat)](http://cocoapods.org/pods/NoOptionalInterpolation)
[![License](https://img.shields.io/cocoapods/l/NoOptionalInterpolation.svg?style=flat)](http://cocoapods.org/pods/NoOptionalInterpolation)
[![Platform](https://img.shields.io/cocoapods/p/NoOptionalInterpolation.svg?style=flat)](http://cocoapods.org/pods/NoOptionalInterpolation)

## Description

NoOptionalInterpolation gets rid of "Optional(...)" and "nil" in Swift's string interpolation. This is particularly helpful when you set text to the UI elements such as `UILabel` or `UIButton`. Since XCode currently (as of the time this is written) has no warnings when interpolating `Optional`s, and you might sometimes need to change your variables' type between `Optional` and non-`Optional`, this pod ensures that the text you set never ever includes that annoying additional "Optional(...)".

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

Also, please note that this does not affect the `print` function. Hence, `print(o)` (`o` as in the example above) would still print out `Optional(Optional("nested optionals"))`.

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
