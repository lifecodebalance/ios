import XCTest

enum UT {
  // MARK: –– Test Data Generators

  static func generateEmail() -> String {
    let id = UUID().uuidString.prefix(6)
    return "auto_\(id)@mail.com"
  }

  static func generatePassword() -> String {
    let allowed = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = Int.random(in: 8...16)
    return String((0..<len).compactMap { _ in allowed.randomElement() })
  }

  // MARK: –– App State Helpers

  static func ensureLoggedOut(_ app: XCUIApplication) {
    let logout = app.buttons["logoutButton"]
    if logout.waitForExistence(timeout: 2) {
      if logout.isHittable {
        logout.tap()
      } else {
        app.swipeUp()
        if logout.waitForExistence(timeout: 1) && logout.isHittable {
          logout.tap()
        }
      }
    }
  }

  static func tapShockEntry(_ app: XCUIApplication) {
    ensureLoggedOut(app)
    let btn = app.buttons["navigationButton"]
    XCTAssertTrue(btn.waitForExistence(timeout: 3), "«В шок» не найден")
    btn.tap()
  }
}

extension XCUIElement {
  func clearText() {
    guard let existing = self.value as? String else { return }
    tap()
    let delete = String(repeating: XCUIKeyboardKey.delete.rawValue, count: existing.count)
    typeText(delete)
  }

  func clearTextAndType(_ text: String) {
    clearText()
    typeText(text)
  }
}
