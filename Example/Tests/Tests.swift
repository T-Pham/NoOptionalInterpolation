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

class Tests: QuickSpec {

    override func spec() {
        describe("String Interpolation") {

            it("should omit the optional text") {
                let optionalString: String? = "string1"
                expect("\(optionalString)") == optionalString!
            }

            it("should omit the nil text") {
                let optionalString: String? = nil
                expect("\(optionalString)") == ""
            }

            it("should work for nested optional") {
                let nestedOptionalString: String?? = "string2"
                expect("\(nestedOptionalString)") == nestedOptionalString!!
            }

            it("should work for the example") {
                let n: Int? = 1
                let t: String? = nil
                let s: String? = "string1"
                let o: String?? = "string2"
                expect("\(n) \(t) \(s) \(o)") == "1  string1 string2"
            }
        }

        describe("* Operator") {
            it("should NOT omit the optional text") {
                let optionalString: String? = "string1"
                expect("\(optionalString*)") == "Optional(\"string1\")"
            }

            it("should NOT omit the nil text") {
                let optionalString: String? = nil
                expect("\(optionalString*)") == "nil"
            }

            it("should work for nested optional") {
                let nestedOptionalString: String?? = "string2"
                expect("\(nestedOptionalString*)") == "Optional(Optional(\"string2\"))"
            }

            it("should work for the example") {
                let n: Int? = 1
                let t: String? = nil
                let s: String? = "string1"
                let o: String?? = "string2"
                expect("\(n*) \(t*) \(s*) \(o*)") == "Optional(1) nil Optional(\"string1\") Optional(Optional(\"string2\"))"
            }
        }
    }
}
