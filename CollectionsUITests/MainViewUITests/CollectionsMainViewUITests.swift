//
//  CollectionsUITests.swift
//  CollectionsUITests
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import XCTest

class CollectionsMainViewUITests: XCTestCase {

    let accessibility = MainViewAccessibility()

    var app: XCUIApplication!
    var tableView: XCUIElement!
    var arrayTableViewCell: XCUIElement!
    var setTableViewCell: XCUIElement!
    var dictionaryTableViewCell: XCUIElement!
    var navBar: XCUIElement!
    var navBarBackButton: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()

        self.tableView = app.tables[accessibility.tableView]
        self.arrayTableViewCell = tableView.cells.element(boundBy: 0)
        self.setTableViewCell = tableView.cells.element(boundBy: 1)
        self.dictionaryTableViewCell = tableView.cells.element(boundBy: 2)
        self.navBar = app.navigationBars[accessibility.navigationBar]
        self.navBarBackButton = navBar.buttons.element(boundBy: 0)
    }

    func testThePresenceOfElements() throws {
        XCTAssertTrue(tableView.exists)
        XCTAssertTrue(arrayTableViewCell.exists)
        XCTAssertTrue(setTableViewCell.exists)
        XCTAssertTrue(dictionaryTableViewCell.exists)
        XCTAssertTrue(navBar.exists)
    }

    func testTransitionToTheNextViewThroughTableViewCell() throws {
        XCTAssertTrue(app.isOnMainView)
        arrayTableViewCell.tap()
        XCTAssertTrue(app.isOnArrayView)
        navBarBackButton.tap()
        setTableViewCell.tap()
        XCTAssertTrue(app.isOnSetView)
        navBarBackButton.tap()
        dictionaryTableViewCell.tap()
        XCTAssertTrue(app.isOnDictionaryView)
        navBarBackButton.tap()
    }
}
