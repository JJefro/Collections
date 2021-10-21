//
//  DictionaryViewModelTests.swift
//  CollectionsTests
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import XCTest
@testable import Collections

class DictionaryViewModelTests: XCTestCase {

    var sut: DictionaryViewController!
    var mut: DictionaryViewModel!

    override func setUpWithError() throws {
        sut = DictionaryViewController()
        mut = DictionaryViewModel()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        mut = nil
    }

    func testLabels_whenLoaded_isLabelConnected() throws {
        _ = try XCTUnwrap(sut.arrayLabel, "The arrayLabel is not connected")
        _ = try XCTUnwrap(sut.arrayLabel, "The arrayLabel is not connected")
    }

    func testCollectionView_whenLoaded_isCollectionViewConnected() throws {
        _ = try XCTUnwrap(sut.collectionView, "The collectionView is not connected")
    }

    func testLabels_isLabelTitleCorrect() throws {
        XCTAssertEqual(sut.arrayLabel.text, "Array")
        XCTAssertEqual(sut.dictionaryLabel.text, "Dictionary")
    }

    func testCollectionView_CorrectNumberOfCells() throws {
        XCTAssertEqual(sut.collectionView.numberOfItems(inSection: 0), 6)
    }

    func testCollectionView_isCorrectOperationsTitles() throws {

        let cell1 = sut.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) as! DictionaryVCollectionViewCell

        let cell2 = sut.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 1, section: 0)) as! DictionaryVCollectionViewCell

        let cell3 = sut.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 2, section: 0)) as! DictionaryVCollectionViewCell

        let cell4 = sut.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 3, section: 0)) as! DictionaryVCollectionViewCell

        let cell5 = sut.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 4, section: 0)) as! DictionaryVCollectionViewCell

        let cell6 = sut.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 5, section: 0)) as! DictionaryVCollectionViewCell

        XCTAssertEqual(cell1.textLabel.text, "Find the first contact")
        XCTAssertEqual(cell2.textLabel.text, "Find the first contact")
        XCTAssertEqual(cell3.textLabel.text, "Find the last contact")
        XCTAssertEqual(cell4.textLabel.text, "Find the last contact")
        XCTAssertEqual(cell5.textLabel.text, "Search for a non-existing element")
        XCTAssertEqual(cell6.textLabel.text, "Search for a non-existing element")
    }

    func testFictionaryView_Colors() throws {
        let cell = sut.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(sut.view.backgroundColor, R.color.dictionaryViewBackground())
        XCTAssertEqual(cell.backgroundColor, R.color.dictionaryViewCell())
        XCTAssertEqual(sut.arrayLabel.textColor, R.color.dictionaryViewTextColor())
        XCTAssertEqual(sut.dictionaryLabel.textColor, R.color.dictionaryViewTextColor())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
