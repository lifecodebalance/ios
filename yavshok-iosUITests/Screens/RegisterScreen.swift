import XCTest

final class RegisterScreen {
  private let app: XCUIApplication
  init(_ app: XCUIApplication) { self.app = app }

  // MARK: –– Locators
  private var emailField: XCUIElement { app.textFields["emailField"] }
  private var passwordField: XCUIElement { app.secureTextFields["passwordField"] }
  private var ageField: XCUIElement { app.textFields["ageField"] }
  private var registerButton: XCUIElement { app.buttons["registerButton"] }
  private var backButton: XCUIElement { app.buttons["backButton"] }
  private var logoutButton: XCUIElement { app.buttons["logoutButton"] }

  // MARK: –– Actions
  func register(email: String, password: String, age: String) {
    XCTAssertTrue(emailField.waitForExistence(timeout: 2), "Поле email не найдено")
    emailField.tap(); emailField.typeText(email)
    
    XCTAssertTrue(passwordField.waitForExistence(timeout: 2), "Поле пароля не найдено")
    passwordField.tap(); passwordField.clearTextAndType(password)
    
    XCTAssertTrue(ageField.waitForExistence(timeout: 2), "Поле возраста не найдено")
    ageField.tap(); ageField.typeText(age)
    
    registerButton.tap()
  }

  func logoutIfNeeded() {
    if logoutButton.waitForExistence(timeout: 2) {
      if logoutButton.isHittable {
        logoutButton.tap()
      } else {
        app.swipeUp()
        if logoutButton.waitForExistence(timeout: 1) && logoutButton.isHittable {
          logoutButton.tap()
        }
      }
    }
  }

  func goBack() {
    backButton.tap()
  }
}
