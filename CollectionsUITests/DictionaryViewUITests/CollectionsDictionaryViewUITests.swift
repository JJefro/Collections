//
//  CollectionsDictionaryViewUITests.swift
//  CollectionsUITests
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import XCTest

class CollectionsDictionaryViewUITests: XCTestCase {

    let accessibility = DictionaryViewControllerAccessibility()

    var app: XCUIApplication!
    var tableView: XCUIElement!
    var dictionaryTableViewCell: XCUIElement!
    var navBar: XCUIElement!
    var navBarBackButton: XCUIElement!
    var arrayLabel: XCUIElement!
    var dictionaryLabel: XCUIElement!
    var stackView: XCUIElement!
    var viewActivityIndicator: XCUIElement!
    var loadingView: XCUIElement!

    var collectionView: XCUIElement!
    var collectionViewCells: XCUIElementQuery!
    var collectionViewFirstCell: XCUIElement!
    var cellActivityIndicator: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()

        self.tableView = app.tables[accessibility.tableView]
        self.dictionaryTableViewCell = tableView.cells.element(boundBy: 2)
        self.navBar = app.navigationBars[accessibility.navigationBar]
        self.navBarBackButton = navBar.buttons.element(boundBy: 0)
        self.collectionView = app.collectionViews[accessibility.collectionView]
        self.collectionViewCells = collectionView.cells
        self.arrayLabel = app.staticTexts[accessibility.arrayLabel]
        self.dictionaryLabel = app.staticTexts[accessibility.dictionaryLabel]
        self.loadingView = app.otherElements[accessibility.loadingView]
        self.viewActivityIndicator = loadingView.otherElements.element(matching: .any, identifier: accessibility.viewActivityIndicator)
    }

    func testThePresenceOfElements() throws {
        dictionaryTableViewCell.tap()
        XCTAssertTrue(loadingView.exists)
        XCTAssertTrue(viewActivityIndicator.exists)
        XCTAssertTrue(app.isOnDictionaryView)
        XCTAssertTrue(navBarBackButton.exists)
        XCTAssertTrue(collectionView.exists)
        XCTAssertTrue(arrayLabel.exists)
        XCTAssertTrue(dictionaryLabel.exists)
        XCTAssertEqual(collectionViewCells.count, 6)
    }
}
