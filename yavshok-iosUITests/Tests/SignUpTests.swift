import XCTest

final class SignUpTests: XCTestCase {
  var app: XCUIApplication!
  var auth: AuthScreen!
  var reg: RegisterScreen!

  override func setUp() {
    super.setUp()
    app = XCUIApplication()
    app.launch()
    UT.tapShockEntry(app)
    auth = AuthScreen(app)
    auth.navigateToRegister()
    reg = RegisterScreen(app)
  }

  func testUnder21_ShowsYoungCat() {
    let email = UT.generateEmail()
    let pwd = UT.generatePassword()
    reg.register(email: email, password: pwd, age: "18")
    let label = app.staticTexts["Ты молоденький котик"]
    XCTAssertTrue(wait(label), "Молоденький котик не показан")
  }

  func test21To68_ShowsAdultCat() {
    let email = UT.generateEmail()
    let pwd = UT.generatePassword()
    reg.register(email: email, password: pwd, age: "35")
    let label = app.staticTexts["Ты взрослый котик"]
    XCTAssertTrue(wait(label), "Взрослый котик не показан")
  }

  func testOver68_ShowsOldCat() {
    let email = UT.generateEmail()
    let pwd = UT.generatePassword()
    reg.register(email: email, password: pwd, age: "72")
    let label = app.staticTexts["Ты старый котик"]
    XCTAssertTrue(wait(label), "Старый котик не показан")
  }

  func testBackButton_ReturnsToSignIn() {
    reg.goBack()
    let loginTitle = app.staticTexts["Войти в ШОК"]
    XCTAssertTrue(wait(loginTitle), "Не вернулись на экран входа")
  }
}
