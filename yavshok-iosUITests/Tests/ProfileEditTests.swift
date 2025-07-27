import XCTest

final class ProfileEditTests: XCTestCase {
  var app: XCUIApplication!
  var auth: AuthScreen!
  var profile: ProfileScreen!

  override func setUp() {
    super.setUp()
    app = XCUIApplication()
    app.launch()
    UT.tapShockEntry(app)
    auth = AuthScreen(app)
    auth.login(email: "molodoy@mail.ru", password: "123456")
    profile = ProfileScreen(app)
    profile.openEditor()
  }

  func testEditAndSave_UpdatesName() {
    let editName = "himynameis\(Int.random(in: 100...999))"
    let nameField = app.textFields["nameField"]
    nameField.clearTextAndType(editName)
    app.buttons["saveButton"].tap()
    XCTAssertTrue(wait(app.staticTexts[editName]))
  }

  func testEditAndCancel_RevertsName() {
    let orig = profile.currentUserName()
    let nameField = app.textFields["nameField"]
    nameField.clearTextAndType("Test123123")
    app.buttons["cancelButton"].tap()
    XCTAssertEqual(profile.currentUserName(), orig)
  }
    
}
