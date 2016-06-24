//
//  NoOptionalInterpolation.swift
//  Pods
//
//  Created by Thanh Pham on 5/27/16.
//
//

public protocol Unwrappable {
    func unwrap() -> Any?
}

extension Optional: Unwrappable {
    public func unwrap() -> Any? {
        switch self {
        case nil:
            return nil
        case let unwrappable as Unwrappable:
            return unwrappable.unwrap()
        case let any:
            return any
        }
    }
}

public struct WrappedUnwrappable {
    let unwrappable: Unwrappable
}

extension WrappedUnwrappable: Unwrappable {
    public func unwrap() -> Any? {
        return unwrappable
    }
}

postfix operator * {}

public postfix func *(unwrappable: Unwrappable) -> WrappedUnwrappable {
    return WrappedUnwrappable(unwrappable: unwrappable)
}

public extension String {
    init(stringInterpolationSegment expr: Unwrappable) {
        if let unwrapped = expr.unwrap() {
            self.init(stringInterpolationSegment: unwrapped)
        } else {
            self.init()
        }
    }
}

public protocol Intable {
    func int() -> Int
}

extension Int: Intable {
    public func int() -> Int {
        return self
    }
}

extension Intable where Self: Unwrappable {
    public func int() -> Int {
        if let int = self.unwrap() as? Int {
            return int
        } else {
            return 0
        }
    }
}

extension Optional: Intable {}

public protocol Wordable {
    var singularForm: String { get }
    var pluralForm: String { get }
}

public struct Word: Wordable {
    public var singularForm: String
    public var pluralForm: String
}

public protocol Pluralizer {
    static func apply(word: String) -> String
}

public class SimplePluralizer: Pluralizer {
    public class func apply(word: String) -> String {
        return word.characters.count == 0 ? "" : word + "s"
    }
}

public var PluralizerType: Pluralizer.Type = SimplePluralizer.self

extension String: Wordable {
    public var singularForm: String {
        get {
            return self
        }
    }

    public var pluralForm: String {
        return PluralizerType.apply(self)
    }
}

extension Wordable where Self: Unwrappable {
    public var singularForm: String {
        get {
            return "\(self)"
        }
    }

    public var pluralForm: String {
        return PluralizerType.apply(self.singularForm)
    }
}

extension Optional: Wordable {}

infix operator ~ { precedence 131 }

public func ~(amount: Intable, word: Wordable) -> String {
    let quantity = amount.int()
    let pluralizedWord = quantity == 1 ? word.singularForm : word.pluralForm
    return String(quantity) + (pluralizedWord.characters.count == 0 ? "" : " ") + pluralizedWord
}

public func ~(word: Wordable, amount: Intable) -> String {
    return amount.int() == 1 ? word.singularForm : word.pluralForm
}

public func ~(optional1: Optional<Any>, optional2: Optional<Any>) -> String {
    let unwrapped1 = optional1.unwrap()
    let unwrapped2 = optional2.unwrap()
    if unwrapped1 is Int || unwrapped2 is String {
        return (unwrapped1 as Intable) ~ (unwrapped2 as Wordable)
    }
    return (unwrapped1 as Wordable) ~ (unwrapped2 as Intable)
}

public func /(singularForm: String, pluralForm: String) -> Word {
    return Word(singularForm: singularForm, pluralForm: pluralForm)
}
