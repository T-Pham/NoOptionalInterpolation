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
        case .None:
            return nil
        case .Some(let unwrappable as Unwrappable):
            return unwrappable.unwrap()
        case .Some(let some):
            return some
        }
    }
}

public extension String {
    init(stringInterpolationSegment expr: Unwrappable) {
        self = String(expr.unwrap() ?? "")
    }
}
