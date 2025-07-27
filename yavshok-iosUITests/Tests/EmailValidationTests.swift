import XCTest

final class EmailValidationTests: XCTestCase {
  var app: XCUIApplication!

  override func setUp() {
    super.setUp()
    app = XCUIApplication()
    app.launch()
  }

  func testEmailNotRegistered_ShowsFailure() {
    let email = UT.generateEmail()
    let emailField = app.textFields["emailInput"]
    XCTAssertTrue(wait(emailField))
    emailField.tap(); emailField.typeText(email)
    app.buttons["checkButton"].tap()
    let fail = app.staticTexts["failureText"]
    XCTAssertTrue(wait(fail), "Текст отказа не появился")
    XCTAssertEqual(fail.label, "Ты еще не в ШОКе")
  }

  func testEmailAlreadyShocked_ShowsSuccess() {
    let emailField = app.textFields["emailInput"]
    XCTAssertTrue(wait(emailField))
    emailField.tap(); emailField.typeText("molodoy@mail.ru")
    app.buttons["checkButton"].tap()
    let success = app.staticTexts["successText"]
    XCTAssertTrue(wait(success))
    XCTAssertEqual(success.label, "Ты уже в ШОКе")
    XCTAssertTrue(app.images.count > 0, "Гифка не показана")
  }
}
