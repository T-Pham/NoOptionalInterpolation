//
//  Tests.swift
//  NoOptionalInterpolation
//
//  Created by Thanh Pham on 5/31/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import NoOptionalInterpolation

class Tests: QuickSpec {

    override func spec() {

        describe("String Interpolation") {

            it("should omit the optional text") {
                let optionalString: String? = "string1"
                XCTAssertEqual("\(optionalString)", optionalString!)
            }

            it("should omit the nil text") {
                let optionalString: String? = nil
                XCTAssertEqual("\(optionalString)", "")
            }

            it("should work for nested optional") {
                let nestedOptionalString: String?? = "string2"
                XCTAssertEqual("\(nestedOptionalString)", nestedOptionalString!!)
            }

            it("should work for the example") {
                let n: Int? = 1
                let t: String? = nil
                let s: String? = "string1"
                let o: String?? = "string2"
                XCTAssertEqual("\(n) \(t) \(s) \(o)", "1  string1 string2")
            }
        }

        describe("* Operator") {

            it("should NOT omit the optional text") {
                let optionalString: String? = "string1"
                XCTAssertEqual("\(optionalString*)", "Optional(\"string1\")")
            }

            it("should NOT omit the nil text") {
                let optionalString: String? = nil
                XCTAssertEqual("\(optionalString*)", "nil")
            }

            it("should work for nested optional") {
                let nestedOptionalString: String?? = "string2"
                XCTAssertEqual("\(nestedOptionalString*)", "Optional(Optional(\"string2\"))")
            }

            it("should work for the example") {
                let n: Int? = 1
                let t: String? = nil
                let s: String? = "string1"
                let o: String?? = "string2"
                XCTAssertEqual("\(n*) \(t*) \(s*) \(o*)", "Optional(1) nil Optional(\"string1\") Optional(Optional(\"string2\"))")
            }
        }

        describe("Pluralization") {

            context("with quantity") {

                it("should pluralize word") {
                    XCTAssertEqual(2 ~ "string", "2 strings")
                }

                it("should NOT pluralize word when the quantity is 1") {
                    XCTAssertEqual(1 ~ "string", "1 string")
                }
            }

            context("without quantity") {

                it("should pluralize word") {
                    XCTAssertEqual("string" ~ 2, "strings")
                }

                it("should NOT pluralize word when the quantity is 1") {
                    XCTAssertEqual("string" ~ 1, "string")
                }
            }

            it("should allow specifying plural form") {
                XCTAssertEqual(2 ~ "person" / "people", "2 people")
            }

            it("should work for optionals") {
                let nothing: Any?? = nil
                let string: String?? = "string"
                let int: Int?? = 2
                XCTAssertEqual(int ~ string, "2 strings")
                XCTAssertEqual(string ~ int, "strings")
                XCTAssertEqual(int ~ nothing, "2")
                XCTAssertEqual(nothing ~ int, "")
                XCTAssertEqual(nothing ~ string, "0 strings")
                XCTAssertEqual(string ~ nothing, "strings")
                XCTAssertEqual(nothing ~ nothing, "")
            }
        }
    }
}
