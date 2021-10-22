import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(Fraction_swiftTests.allTests),
  ]
}
#endif
