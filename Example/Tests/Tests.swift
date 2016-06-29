//
//  Tests.swift
//  NoOptionalInterpolation
//
//  Created by Thanh Pham on 5/31/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import NoOptionalInterpolation
import Pluralize_swift

extension Pluralize: Pluralizer {}

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

        describe("Pluralization") {

            context("with quantity") {

                it("should pluralize word") {
                    expect(2 ~ "string") == "2 strings"
                }

                it("should NOT pluralize word when the quantity is 1") {
                    expect(1 ~ "string") == "1 string"
                }
            }

            context("without quantity") {

                it("should pluralize word") {
                    expect("string" ~ 2) == "strings"
                }

                it("should NOT pluralize word when the quantity is 1") {
                    expect("string" ~ 1) == "string"
                }
            }

            it("should allow specifying plural form") {
                expect(2 ~ "person" / "people") == "2 people"
            }

            it("should work for optionals") {
                let nothing: Any?? = nil
                let string: String?? = "string"
                let int: Int?? = 2
                expect(int ~ string) == "2 strings"
                expect(string ~ int) == "strings"
                expect(int ~ nothing) == "2"
                expect(nothing ~ int) == ""
                expect(nothing ~ string) == "0 strings"
                expect(string ~ nothing) == "strings"
                expect(nothing ~ nothing) == ""
            }

            it("should support custom pluralizer") {
                PluralizerType = Pluralize.self
                expect(2 ~ "oasis") == "2 oases"
                PluralizerType = SimplePluralizer.self
            }
        }
    }
}
