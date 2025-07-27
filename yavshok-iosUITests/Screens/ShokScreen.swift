import XCTest

final class ShockScreen {
  private let app: XCUIApplication
  init(_ app: XCUIApplication) { self.app = app }

  // MARK: –– Locators для «Я в ШОКе»
  private var emailInput: XCUIElement { app.textFields["emailInput"] }
  private var checkButton: XCUIElement { app.buttons["checkButton"] }
  private var successText: XCUIElement { app.staticTexts["successText"] }
  private var failureText: XCUIElement { app.staticTexts["failureText"] }
  private var images: XCUIElementQuery { app.images }

  // MARK: –– Actions
  func enterEmailAndCheck(_ email: String) {
    XCTAssertTrue(emailInput.waitForExistence(timeout: 2), "Поле email не найдено на экране шока")
    emailInput.tap(); emailInput.typeText(email)
    XCTAssertTrue(checkButton.waitForExistence(timeout: 2), "Кнопка проверки не найдена")
    checkButton.tap()
  }

  func isSuccess() -> Bool {
    return successText.waitForExistence(timeout: 5)
  }

  func isFailure() -> Bool {
    return failureText.waitForExistence(timeout: 5)
  }
}
