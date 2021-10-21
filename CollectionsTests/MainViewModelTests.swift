//
//  CollectionsTests.swift
//  CollectionsTests
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import XCTest
@testable import Collections

class MainViewModelTests: XCTestCase {

    var sut: MainViewController!
    var mut: MainViewModel!

    override func setUpWithError() throws {
        sut = MainViewController()
        mut = MainViewModel()

        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        mut = nil
    }

    func testView_CorrectTitle() throws {
        XCTAssertEqual(sut.title, "Collections")
    }

    func testTableView_WhenLoaded_isTableViewConnected() throws {
        _ = try XCTUnwrap(sut.tableView, "The TableView is not connected")
    }

    func testTableView_CorrectNumberOfRows() throws {
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 3)
    }

    func testTableView_CorrectRowsTitles() throws {
        let arrayCellTitle = sut.dataSource.objects[0].title
        let setCellTitle = sut.dataSource.objects[1].title
        let dictionaryCellTitle = sut.dataSource.objects[2].title
        XCTAssertEqual(arrayCellTitle, "Array")
        XCTAssertEqual(setCellTitle, "Set")
        XCTAssertEqual(dictionaryCellTitle, "Dictionary")
    }

    func testMainView_Colors() throws {
        XCTAssertEqual(sut.view.backgroundColor, R.color.mainViewBackground())
        XCTAssertEqual(sut.tableView.backgroundColor, R.color.mainViewBackground())
    }

    func testSut_GenerateRandomInt() throws {
        mut.generateRandomInt()
        print(mut.randomInt)
        XCTAssertNotEqual(mut.randomInt, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
