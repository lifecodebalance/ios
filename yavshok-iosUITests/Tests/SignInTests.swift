import XCTest

final class SignInTests: XCTestCase {
  var app: XCUIApplication!
  var auth: AuthScreen!

  override func setUp() {
    super.setUp()
    app = XCUIApplication()
    app.launch()
    UT.tapShockEntry(app)
    auth = AuthScreen(app)
  }

  func testInvalidCredentials_DisplaysError() {
    let email = UT.generateEmail()
    let pwd = UT.generatePassword()
    auth.login(email: email, password: pwd)
    let err = auth.lastErrorMessage()
    XCTAssertEqual(err, "Email или пароль неправильные")
  }

  func testValidLogin_ShowsPhotos() {
    auth.login(email: "molodoy@mail.ru", password: "123456")
    XCTAssertTrue(app.images.count > 3, "Не все фото загружены")
  }

  func testBackButton_ReturnsHome() {
    auth.goBack()
    XCTAssertTrue(app.buttons["navigationButton"].exists)
  }
}
