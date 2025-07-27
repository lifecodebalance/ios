import XCTest

extension XCTestCase {
  func wait(_ element: XCUIElement,
            timeout: TimeInterval = 5,
            file: StaticString = #file,
            line: UInt = #line) -> Bool {
    return element.waitForExistence(timeout: timeout)
  }
}
