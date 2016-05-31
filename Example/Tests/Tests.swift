//
//  ArrayTests.swift
//  NoUnderscoreS
//
//  Created by Thanh Pham on 5/31/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import NoOptionalInterpolation

import XCTest

class ArrayTests: QuickSpec {

    override func spec() {
        describe("String Interpolation") {

            it("should omit the optional text") {
                let optionalString:String? = "optionalString"
                expect("\(optionalString)") == "\(optionalString!)"
            }

            it("should omit the nil text") {
                let optionalString:String? = nil
                expect("\(optionalString)") == ""
            }

            it("should work for nested optional") {
                let optionalString: String?? = "nested optional text"
                expect("\(optionalString)") == "\(optionalString!!)"
            }

            it("should work for the example") {
                let n:Int? = 1
                let t:String? = nil
                let s:String? = "string"
                let o:String?? = "nested optionals"
                expect("\(n) \(t) \(s) \(o)") == "1  string nested optionals"
            }
        }
    }
}
