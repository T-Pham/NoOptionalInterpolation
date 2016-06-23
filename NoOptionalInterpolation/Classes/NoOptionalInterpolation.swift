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

public struct Word {
    var singularForm: String
    var pluralForm: String
}

extension Word {
    init(singularForm aSingularForm: String) {
        singularForm = aSingularForm
        pluralForm = singularForm + "s"
    }
}

extension Word: StringLiteralConvertible {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = StringLiteralType

    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: value)
    }

    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }

    public init(stringLiteral value: StringLiteralType) {
        self.init(singularForm: value)
    }
}

infix operator ~ { precedence 100 }

public func ~(amount: Intable, word: Word) -> String {
    let quantity = amount.int()
    return String(quantity) + " " + (quantity == 1 ? word.singularForm : word.pluralForm)
}

public func ~(word: Word, amount: Intable) -> String {
    return amount.int() == 1 ? word.singularForm : word.pluralForm
}

public func /(singularForm: String, pluralForm: String) -> Word {
    return Word(singularForm: singularForm, pluralForm: pluralForm)
}
