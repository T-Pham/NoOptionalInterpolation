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

[![CI Status](https://img.shields.io/travis/T-Pham/NoOptionalInterpolation.svg?style=flat-square)](https://travis-ci.org/T-Pham/NoOptionalInterpolation)
[![GitHub issues](https://img.shields.io/github/issues/T-Pham/NoOptionalInterpolation.svg?style=flat-square)](https://github.com/T-Pham/NoOptionalInterpolation/issues)
[![Codecov](https://img.shields.io/codecov/c/github/T-Pham/NoOptionalInterpolation.svg?style=flat-square)](https://codecov.io/gh/T-Pham/NoOptionalInterpolation)
[![Documentation](https://img.shields.io/cocoapods/metrics/doc-percent/NoOptionalInterpolation.svg?style=flat-square)](http://cocoadocs.org/docsets/NoOptionalInterpolation)

[![GitHub release](https://img.shields.io/github/tag/T-Pham/NoOptionalInterpolation.svg?style=flat-square&label=release)](https://github.com/T-Pham/NoOptionalInterpolation/releases)
[![Platform](https://img.shields.io/cocoapods/p/NoOptionalInterpolation.svg?style=flat-square)](https://github.com/T-Pham/NoOptionalInterpolation)
[![License](https://img.shields.io/cocoapods/l/NoOptionalInterpolation.svg?style=flat-square)](LICENSE)

[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage)

[![CocoaPods](https://img.shields.io/badge/CocoaPods-compatible-4BC51D.svg?style=flat-square)](https://cocoapods.org/pods/NoOptionalInterpolation)
[![CocoaPods downloads](https://img.shields.io/cocoapods/dt/NoOptionalInterpolation.svg?style=flat-square)](https://cocoapods.org/pods/NoOptionalInterpolation)

## Description

NoOptionalInterpolation gets rid of "Optional(...)" and "nil" in Swift's string interpolation. This is particularly helpful when you set text to UI elements such as `UILabel` or `UIButton`. Since XCode currently, as of the time this is written, does not show any warnings when interpolating `Optional`s, and you might sometimes need to change your variables' type between `Optional` and non-`Optional`, this library ensures that the text you set never ever includes that annoying additional "Optional(...)". You can also revert to the default behavior when needed.

Besides, the library makes pluralizing your text easier with custom operators.

## Usage

### Remove "Optional(...)" and "nil":

Just import NoOptionalInterpolation and everything is done for you.

```swift
import NoOptionalInterpolation

let n: Int? = 1
let t: String? = nil
let s: String? = "string1"
let o: String?? = "string2"

let i = "\(n) \(t) \(s) \(o)"
print(i) // 1  string1 string2
```

Also, please note that this does not affect the `print` function. Hence, `print(o)` (as opposed to `print("\(o)")`, `o` as in the example above) would still print out `Optional(Optional("string2"))`.

### Revert to the default behavior:

Use the `*` operator for your `Optional`s.

```swift
...
let i = "\(n*) \(t*) \(s*) \(o*)"
print(i) // Optional(1) nil Optional("string1") Optional(Optional("string2"))
```

### Pluralization:

Use the `~` operator to pluralize words.

```swift
let age = 42
let text = "I am \(age ~ "year") old" // "I am 42 years old" // actually not // for now
```

Use the `/` operator to provide the plural form.

```swift
let memberCount = 42
let text = "The team consists of \(memberCount ~ "person" / "people")" // "The team consists of 42 people"
```

To omit the quantity, swap the position of the quantity and the word.

```swift
let listenerCount = 42
let text = "Do it \("yourself" / "yourselves" ~ listenerCount)" // "Do it yourselves"
```

It also works with `Optional`s.

```swift
let count: Int?? = 42
let fruit: String?? = "apple"
let text = "I have \(count ~ fruit)" // "I have 42 apples"
```

By default, if you don't provide a plural form using the `/` operator, an "s" is appended to your word to make the plural form. To make the pluralization smarter, you can specify a custom `PluralizerType`. You can find one [here](https://github.com/joshualat/Pluralize.swift).

In your Podfile:

```ruby
pod 'Pluralize.swift', :git => "https://github.com/joshualat/Pluralize.swift.git"
```

Then:

```swift
import NoOptionalInterpolation
import Pluralize_swift

extension Pluralize: NoOptionalInterpolation.Pluralizer {}

...
NoOptionalInterpolation.PluralizerType = Pluralize.self
assert(42 ~ "oasis" == "42 oases")
```

## Installation

### [CocoaPods](https://cocoapods.org/pods/NoOptionalInterpolation)

Add the line below to your Podfile:

```ruby
pod 'NoOptionalInterpolation'
```

### [Carthage](https://github.com/Carthage/Carthage)

Add the line below to your Cartfile:

```ruby
github "T-Pham/NoOptionalInterpolation"
```

### [Manually](https://google.com)

Add all the files in `NoOptionalInterpolation/NoOptionalInterpolation/Classes/` to your project. You are all set.

##Compatibility
From version 1.0.0, Swift 2 syntax is used. If your project is still using earlier versions of Swift, please use a NoOptionalInterpolation version prior to 1.0.0.

Podfile

```ruby
pod 'NoOptionalInterpolation', '~> 0.3'
```

or Cartfile

```ruby
github "T-Pham/NoOptionalInterpolation" ~> 0.3
```

## License

NoOptionalInterpolation is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
