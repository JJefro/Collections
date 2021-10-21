//
//  ArrayViewModelTests.swift
//  CollectionsTests
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import XCTest
@testable import Collections

class ArrayViewModelTests: XCTestCase {

    var sut: ArrayViewController!
    var mut: ArrayViewModel!

    override func setUpWithError() throws {
        sut = ArrayViewController()
        mut = ArrayViewModel()
        sut.loadViewIfNeeded()

        sut.collectionView.dataSource = sut.dataSource
        sut.collectionView.register(ArrayVCollectionViewCell.self, forCellWithReuseIdentifier: ArrayVCollectionViewCell.identifier)
    }

    override func tearDownWithError() throws {
        sut = nil
        mut = nil
    }

    func testCollectionView_WhenLoaded_isCollectionViewConnected() throws {
        _ = try XCTUnwrap(sut.collectionView, "The Collection is not connected")
    }

    func testCollectionView_CorrectNumberOfCells() throws {
        XCTAssertEqual(sut.collectionView.numberOfItems(inSection: 0), 1)
        mut.performOperation(at: IndexPath(row: 0, section: 0)) { [self] in
            XCTAssertEqual(sut.collectionView.numberOfItems(inSection: 0), 13)
        }
    }

    func testCollectionView_isCorrectOperationsTitles() throws {

        let cell1 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) as! ArrayVCollectionViewCell

        let cell2 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(item: 0, section: 1)) as! ArrayVCollectionViewCell

        let cell3 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 2)) as! ArrayVCollectionViewCell

        let cell4 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 3)) as! ArrayVCollectionViewCell

        let cell5 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 4)) as! ArrayVCollectionViewCell

        let cell6 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 5)) as! ArrayVCollectionViewCell

        let cell7 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 6)) as! ArrayVCollectionViewCell

        let cell8 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 7)) as! ArrayVCollectionViewCell

        let cell9 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 8)) as! ArrayVCollectionViewCell

        let cell10 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 9)) as! ArrayVCollectionViewCell

        let cell11 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 10)) as! ArrayVCollectionViewCell

        let cell12 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 11)) as! ArrayVCollectionViewCell

        let cell13 = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 12)) as! ArrayVCollectionViewCell

        XCTAssertEqual(cell1.textLabel.text, "Create Int array with 10_000_000 elements")

        mut.performOperation(at: IndexPath(row: 0, section: 0)) { [self] in
            XCTAssertEqual(sut.collectionView.numberOfItems(inSection: 0), 13)
            XCTAssertEqual(cell2.textLabel.text, "Insert at the beginning of an array 1000 elements one-by-one")
            XCTAssertEqual(cell3.textLabel.text, "Insert at the beginning of an array 1000 elements at once")
            XCTAssertEqual(cell4.textLabel.text, "Insert in the middle of an array 1000 elements one-by-one")
            XCTAssertEqual(cell5.textLabel.text, "Insert in the middle of an array 1000 elements at once")
            XCTAssertEqual(cell6.textLabel.text, "Append to the end of an array 1000 elements one-by-one")
            XCTAssertEqual(cell7.textLabel.text, "Append to the end of an array 1000 elements at once")
            XCTAssertEqual(cell8.textLabel.text, "Remove at the beginning 1000 elements one-by-one")
            XCTAssertEqual(cell9.textLabel.text, "Remove at the beginning 1000 elements at once")
            XCTAssertEqual(cell10.textLabel.text, "Remove in the middle 1000 elements one-by-one")
            XCTAssertEqual(cell11.textLabel.text, "Remove in the middle 1000 elements at once")
            XCTAssertEqual(cell12.textLabel.text, "Remove at the end 1000 elements one-by-one")
            XCTAssertEqual(cell13.textLabel.text, "Remove at the end 1000 elements at once")
        }
    }

    func testCollectionsView_CellBackgroundColor() throws {
        let cell = sut.dataSource.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.backgroundColor, R.color.arrayViewCell())
    }

    func testArrayView_BackgroundColor() throws {
        XCTAssertEqual(sut.view.backgroundColor, R.color.arrayViewBackground())
        XCTAssertEqual(sut.collectionView.backgroundColor, R.color.arrayViewBackground())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
