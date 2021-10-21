//
//  CollectionsSetViewUITests.swift
//  CollectionsUITests
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import XCTest

class CollectionsSetViewUITests: XCTestCase {

    let accessibility = SetViewControllerAccessibility()

    var app: XCUIApplication!
    var tableView: XCUIElement!
    var setTableViewCell: XCUIElement!
    var navBar: XCUIElement!
    var navBarBackButton: XCUIElement!
    var topTextField: XCUIElement!
    var bottomTextField: XCUIElement!
    var firstButton: XCUIElement!
    var middleButton: XCUIElement!
    var lastButton: XCUIElement!
    var firstLabel: XCUIElement!
    var middleLabel: XCUIElement!
    var lastLabel: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()

        self.tableView = app.tables[accessibility.tableView]
        self.setTableViewCell = tableView.cells.element(boundBy: 1)
        self.navBar = app.navigationBars[accessibility.navigationBar]
        self.navBarBackButton = navBar.buttons.element(boundBy: 0)
        self.topTextField = app.textFields[accessibility.topTextField]
        self.bottomTextField = app.textFields[accessibility.bottomTextField]
        self.firstButton = app.buttons[accessibility.firstButton]
        self.middleButton = app.buttons[accessibility.middleButton]
        self.lastButton = app.buttons[accessibility.lastButton]
        self.firstLabel = app.staticTexts[accessibility.firstLabel]
        self.middleLabel = app.staticTexts[accessibility.middleLabel]
        self.lastLabel = app.staticTexts[accessibility.lastLabel]
    }

    func testThePresenceOfElements() throws {
        setTableViewCell.tap()
        XCTAssertTrue(app.isOnSetView)
        XCTAssertTrue(navBarBackButton.exists)
        XCTAssertTrue(topTextField.exists)
        XCTAssertTrue(bottomTextField.exists)
        XCTAssertTrue(firstButton.exists)
        XCTAssertTrue(middleButton.exists)
        XCTAssertTrue(lastButton.exists)
        topTextField.tap()
        topTextField.typeText("Hello")
        bottomTextField.tap()
        bottomTextField.typeText("e")
        firstButton.tap()
        middleButton.tap()
        lastButton.tap()
        XCTAssertTrue(firstLabel.exists)
        XCTAssertTrue(middleLabel.exists)
        XCTAssertTrue(lastLabel.exists)
    }

    func testTextFieldsForAllowedLetters() throws {
        setTableViewCell.tap()
        topTextField.tap()
        topTextField.typeText("1!H#/>e-l=35l742o")
        bottomTextField.tap()
        bottomTextField.typeText("1!H#/>e-l=35l742o")
        XCTAssertEqual(topTextField.value as! String, "Hello")
        XCTAssertEqual(bottomTextField.value as! String, "Hello")
    }

    func testGetAllMatchingLetters() throws {
        setTableViewCell.tap()
        topTextField.tap()
        topTextField.typeText("Hello")
        bottomTextField.tap()
        bottomTextField.typeText("e")
        firstButton.tap()
        XCTAssertEqual(firstLabel.label, "e")
    }

    func testGetAllCharactersThatDontMatch() throws {
        setTableViewCell.tap()
        topTextField.tap()
        topTextField.typeText("Hello")
        bottomTextField.tap()
        bottomTextField.typeText("e")
        middleButton.tap()
        XCTAssertEqual(middleLabel.label, "Hllo")
    }

    func testGetAllUniqueCharacters_ThatDontMatch() throws {
        setTableViewCell.tap()
        topTextField.tap()
        topTextField.typeText("Hello")
        bottomTextField.tap()
        bottomTextField.typeText("e")
        lastButton.tap()
        XCTAssertEqual(lastLabel.label, "Ho")
    }
}
