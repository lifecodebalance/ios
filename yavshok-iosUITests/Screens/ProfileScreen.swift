import XCTest

final class ProfileScreen {
  private let app: XCUIApplication
  init(_ app: XCUIApplication) { self.app = app }

  // MARK: –– Locators
    public var editButton: XCUIElement { app.buttons["Редактировать профиль"].firstMatch }
    public var nameLabel: XCUIElement { app.staticTexts["userName"].firstMatch }

  // MARK: –– Actions
  func openEditor() {
    XCTAssertTrue(editButton.waitForExistence(timeout: 5), "Кнопка редактирования не найдена")
    editButton.tap()
  }

  func currentUserName() -> String {
    return nameLabel.label
  }
}
