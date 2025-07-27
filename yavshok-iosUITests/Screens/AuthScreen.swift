import XCTest

final class AuthScreen {
  private let app: XCUIApplication
  init(_ app: XCUIApplication) { self.app = app }

  // MARK: –– Locators
  private var emailField: XCUIElement { app.textFields["emailField"] }
  private var passwordField: XCUIElement { app.secureTextFields["passwordField"] }
  private var loginButton: XCUIElement { app.buttons["loginButton"] }
  private var registerButton: XCUIElement { app.buttons["registerButton"] }
  private var backButton: XCUIElement { app.buttons["backButton"] }
  private var errorLabel: XCUIElement { app.staticTexts["validationError"] }

  // MARK: –– Actions
  func login(email: String, password: String) {
    XCTAssertTrue(emailField.waitForExistence(timeout: 2), "Поле email не найдено")
    emailField.tap(); emailField.typeText(email)

    XCTAssertTrue(passwordField.waitForExistence(timeout: 2), "Поле пароля не найдено")
    passwordField.tap(); passwordField.typeText(password)

    loginButton.tap()
  }

  func navigateToRegister() {
    XCTAssertTrue(registerButton.waitForExistence(timeout: 2), "Кнопка регистрации не найдена")
    registerButton.tap()
  }

  func goBack() {
    backButton.tap()
  }

  func lastErrorMessage() -> String {
    return errorLabel.label
  }
}
