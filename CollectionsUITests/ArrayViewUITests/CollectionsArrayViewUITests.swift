//
//  CollectionsArrayViewUITests.swift
//  CollectionsUITests
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import XCTest

class CollectionsArrayViewUITests: XCTestCase {

    var accessibility = ArrayViewControllerAccessibility()

    var app: XCUIApplication!
    var tableView: XCUIElement!
    var arrayTableViewCell: XCUIElement!
    var collectionView: XCUIElement!
    var navBar: XCUIElement!
    var navBarBackButton: XCUIElement!
    var cellActivityIndicator: XCUIElement!
    var collectionViewCells: XCUIElementQuery!
    var collectionViewFirstCell: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()

        self.tableView = app.tables[accessibility.tableView]
        self.arrayTableViewCell = tableView.cells.element(boundBy: 0)
        self.collectionView = app.collectionViews[accessibility.collectionView]
        self.navBar = app.navigationBars[accessibility.navigationBar]
        self.navBarBackButton = navBar.buttons.element(boundBy: 0)
        self.collectionViewCells = collectionView.cells
        self.collectionViewFirstCell = collectionViewCells.element(boundBy: 0)
//        self.cellActivityIndicator = collectionViewFirstCell.otherElements.element(matching: .any, identifier: accessibility.cellActivityIndicator)
    }

    func testThePresenceOfElements() throws {
        arrayTableViewCell.tap()
        XCTAssertTrue(app.isOnArrayView)
        XCTAssertTrue(navBarBackButton.exists)
        XCTAssertTrue(collectionView.exists)
        collectionViewFirstCell.tap()
        sleep(2)
//        XCTAssertTrue(cellActivityIndicator.exists)
    }

    func testCountOfCells() throws {
        arrayTableViewCell.tap()
        XCTAssertTrue(app.isOnArrayView)
        XCTAssertEqual(collectionViewCells.count, 1)
        collectionViewFirstCell.tap()
        sleep(5)
        XCTAssertEqual(collectionViewCells.count, 13)
    }
}
