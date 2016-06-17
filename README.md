```
'   ____    ___                                                                             
'  |    \  /   \                                                                            
'  |  _  ||     |                                                                           
'  |  |  ||  O  |                                                                           
'  |  |  ||     |                                                                           
'  |  |  ||     |                                                                           
'  |__|__| \___/                                                                            
'                                                                                           
'    ___   ____  ______  ____  ___   ____    ____  _                                        
'   /   \ |    \|      ||    |/   \ |    \  /    || |                                       
'  |     ||  o  )      | |  ||     ||  _  ||  o  || |                                       
'  |  O  ||   _/|_|  |_| |  ||  O  ||  |  ||     || |___                                    
'  |     ||  |    |  |   |  ||     ||  |  ||  _  ||     |                                   
'  |     ||  |    |  |   |  ||     ||  |  ||  |  ||     |                                   
'   \___/ |__|    |__|  |____|\___/ |__|__||__|__||_____|                                   
'                                                                                           
'   ____  ____   ______    ___  ____   ____   ___   _       ____  ______  ____  ___   ____  
'  |    ||    \ |      |  /  _]|    \ |    \ /   \ | |     /    ||      ||    |/   \ |    \ 
'   |  | |  _  ||      | /  [_ |  D  )|  o  )     || |    |  o  ||      | |  ||     ||  _  |
'   |  | |  |  ||_|  |_||    _]|    / |   _/|  O  || |___ |     ||_|  |_| |  ||  O  ||  |  |
'   |  | |  |  |  |  |  |   [_ |    \ |  |  |     ||     ||  _  |  |  |   |  ||     ||  |  |
'   |  | |  |  |  |  |  |     ||  .  \|  |  |     ||     ||  |  |  |  |   |  ||     ||  |  |
'  |____||__|__|  |__|  |_____||__|\_||__|   \___/ |_____||__|__|  |__|  |____|\___/ |__|__|
'
```

# NoOptionalInterpolation

[![CI Status](http://img.shields.io/travis/T-Pham/NoOptionalInterpolation.svg?style=flat)](https://travis-ci.org/T-Pham/NoOptionalInterpolation)
[![Version](https://img.shields.io/cocoapods/v/NoOptionalInterpolation.svg?style=flat)](http://cocoapods.org/pods/NoOptionalInterpolation)
[![License](https://img.shields.io/cocoapods/l/NoOptionalInterpolation.svg?style=flat)](http://cocoapods.org/pods/NoOptionalInterpolation)
[![Platform](https://img.shields.io/cocoapods/p/NoOptionalInterpolation.svg?style=flat)](http://cocoapods.org/pods/NoOptionalInterpolation)

## Description

NoOptionalInterpolation gets rid of "Optional(...)" and "nil" in Swift's string interpolation. This is particularly helpful when you set text to UI elements such as `UILabel` or `UIButton`. Since XCode currently, as of the time this is written, does not show any warnings when interpolating `Optional`s, and you might sometimes need to change your variables' type between `Optional` and non-`Optional`, this pod ensures that the text you set never ever includes that annoying additional "Optional(...)".

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

Also, please note that this does not affect the `print` function. Hence, `print(o)` (as opposed to `print("\(o)")`, `o` as in the example above) would still print out `Optional(Optional("nested optionals"))`.

## Installation

NoOptionalInterpolation is available through [CocoaPods](http://cocoapods.org/pods/NoOptionalInterpolation). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NoOptionalInterpolation'
```

If you want NoOptionalInterpolation to be imported to the whole project, add the following line to your project's Bridging-Header.h file:
```objective-c
@import NoOptionalInterpolation;
```

In case you want to limit the affect of NoOptionalInterpolation within some specific Swift files only, add the line below instead, to the Swift files you want NoOptionalInterpolation to have affect on:
```swift
import NoOptionalInterpolation
```

##Compatibility
From version 1.0.0, Swift 2 syntax is used. If your project is still using earlier versions of Swift, please use a NoOptionalInterpolation version prior to 1.0.0.

```ruby
pod 'NoOptionalInterpolation', '~> 0.3'
```

## License

NoOptionalInterpolation is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
