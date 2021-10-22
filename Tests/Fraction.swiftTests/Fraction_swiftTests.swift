import XCTest
@testable import Fraction_swift

final class Fraction_swiftTests: XCTestCase {
  func testToDecimal() {
    XCTAssertEqual(Fraction(num: 9, den: 59).toDecimalString(withAccuracy: 5), "0.15254")
    XCTAssertEqual(Fraction(num: 5, den: 59).toDecimalString(withAccuracy: 10), "0.0847457627")
    XCTAssertEqual(Fraction(num: 500, den: 59).toDecimalString(withAccuracy: 4), "8.4745")
  }

  func testSimplified() {
    XCTAssertEqual(Fraction(num: 8, den: 16).simplified(), Fraction(num: 1, den: 2))
    XCTAssertEqual(Fraction(num: 16, den: 2).simplified(), Fraction(num: 8, den: 1))
  }

  func testComparable() {
    XCTAssertEqual(Fraction(num: 16, den: 2) > Fraction(num: 8, den: 16), true)
    XCTAssertEqual(Fraction(num: 16, den: 2) > Fraction(num: 8, den: 16).simplified(), true)
    XCTAssertEqual(Fraction(num: 16, den: 2).simplified() > Fraction(num: 8, den: 16), true)

    XCTAssertEqual(Fraction(num: 5, den: 6) < Fraction(num: 3, den: 4), false)
    XCTAssertEqual(Fraction(num: 5, den: 6) > Fraction(num: 3, den: 4), true)

    XCTAssertEqual(Fraction(num: 5, den: 6) < Fraction(num: 10, den: 12), false)
    XCTAssertEqual(Fraction(num: 5, den: 6) > Fraction(num: 10, den: 12), false)
    XCTAssertEqual(Fraction(num: 5, den: 6) == Fraction(num: 10, den: 12), true)
  }

  func testArithmetic() {
    XCTAssertEqual(Fraction(num: 1, den: 2) + Fraction(num: 1, den: 4), Fraction(num: 3, den: 4))
    XCTAssertEqual(Fraction(num: 1, den: 2) - Fraction(num: 1, den: 4), Fraction(num: 1, den: 4))
    XCTAssertEqual(Fraction(num: 1, den: 2) * Fraction(num: 1, den: 4), Fraction(num: 1, den: 8))
    XCTAssertEqual(Fraction(num: 1, den: 2) / Fraction(num: 1, den: 4), Fraction(num: 2, den: 1))
  }
  
  static var allTests = [
    ("testToDecimal", testToDecimal),
    ("testSimplified", testSimplified),
    ("testComparable", testComparable),
    ("testArithmetic", testArithmetic)
  ]
}
