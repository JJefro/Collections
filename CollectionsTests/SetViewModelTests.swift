//
//  SetViewModelTests.swift
//  CollectionsTests
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import XCTest
@testable import Collections

class SetViewModelTests: XCTestCase {

    var sut: SetViewController!
    var mut: SetViewModel!

    override func setUpWithError() throws {
        sut = SetViewController()
        mut = SetViewModel()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        mut = nil
    }

    func testTextFields_whenLoaded_isTextFieldConnected() throws {
        _ = try XCTUnwrap(sut.topTextField, "The topTextField is not connected")
        _ = try XCTUnwrap(sut.bottomTextField, "The bottomTextField is not connected")
    }

    func testButtons_whenLoaded_isButtonConnected() throws {
        _ = try XCTUnwrap(sut.firstButton, "The firstButton is not connected")
        _ = try XCTUnwrap(sut.middleButton, "The middleButton is not connected")
        _ = try XCTUnwrap(sut.lastButton, "The lastButton is not connected")
    }

    func testLabels_whenLoaded_isLabelConnected() throws {
        _ = try XCTUnwrap(sut.firstLabel, "The firstLabel is not connected")
        _ = try XCTUnwrap(sut.middleLabel, "The middleLabel is not connected")
        _ = try XCTUnwrap(sut.lastLabel, "The lastLabel is not connected")
    }

    func testButtons_isButtonTitleCorrect() throws {
        XCTAssertEqual(sut.firstButton.titleLabel?.text, "All matching letters")
        XCTAssertEqual(sut.middleButton.titleLabel?.text, "All characters that do not match")
        XCTAssertEqual(sut.lastButton.titleLabel?.text, "All unique characters from the first text field that do not match in text fields")
    }

    func test_findAllMatchingLetters_betweenTwoInputs() throws {
        let firstInput1 = "Querty"
        let secondInput1 = "Qazr"
        let expectedOutput1 = "Qr"

        let firstInput2 = "Random"
        let secondInput2 = "random23x"
        let expectedOutput2 = "andom"
        XCTAssertEqual(
            mut.findAllMatchingLetters(firstInput: firstInput1, secondInput: secondInput1), expectedOutput1
        )
        XCTAssertEqual(mut.findAllMatchingLetters(firstInput: firstInput2, secondInput: secondInput2),
        expectedOutput2)
    }

    func test_findAllUnmatchingLetters_betweenTwoInputs() throws {
        let firstInput = "asd"
        let secondInput = "azx"
        let expectedOutput = "sdzx"
        XCTAssertEqual(mut.findUnmathingLetters(firstInput: firstInput, secondInput: secondInput),
        expectedOutput)
    }

    func test_findUniqueLetters_inFirstInput_thatDontMatchInTextFields() throws {
        let firstInput = "Hello4"
        let secondInput = "ela123"
        let expectedOutput = "Ho4"
        XCTAssertEqual(mut.findUniqueLetters(firstInput: firstInput, secondInput: secondInput), expectedOutput)
    }

    func testSetView_Colors() throws {
        XCTAssertEqual(sut.view.backgroundColor, R.color.setViewBackgroundColor())

        XCTAssertEqual(sut.firstLabel.textColor, R.color.setViewTextColor())
        XCTAssertEqual(sut.middleLabel.textColor, R.color.setViewTextColor())
        XCTAssertEqual(sut.lastLabel.textColor, R.color.setViewTextColor())

        XCTAssertEqual(sut.firstButton.titleColor(for: .normal), R.color.blue())
        XCTAssertEqual(sut.middleButton.titleColor(for: .normal), R.color.blue())
        XCTAssertEqual(sut.lastButton.titleColor(for: .normal), R.color.blue())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
