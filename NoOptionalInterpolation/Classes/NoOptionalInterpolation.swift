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

public extension String {
    init(stringInterpolationSegment expr: Unwrappable) {
        if let unwrapped = expr.unwrap() {
            self.init(stringInterpolationSegment: unwrapped)
        } else {
            self.init()
        }
    }
}
