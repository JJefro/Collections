//
//  CollectionsModel.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 06/10/2021.
//

import Foundation

class ArrayModel {

    var operations: [ArrayOperation] = [ArrayOperation(title: "Create Int array with 10_000_000 elements")]
    private var data: [ArrayOperation] = []

    var randomInt = Int()
    private var arrayOfInt = [Int]()
    private let arrayOfThousandInt = Array(0...999)

    init() {
        let operation = fetchData()
        data.append(contentsOf: operation)
    }

    func appendData() {
        operations.append(contentsOf: data)
    }

    func updateTitle(at itemNumber: Int) {
        switch itemNumber {
        case 0:
            operations[itemNumber].title = "Array creation time: \(makeOperation(at: itemNumber))"
        case 1..<7:
            operations[itemNumber].title = "Insertion time: \(makeOperation(at: itemNumber))"
        case 7...12:
            operations[itemNumber].title = "Removing time: \(makeOperation(at: itemNumber))"
        default: break
        }
    }

    private func makeOperation(at itemNumber: Int) -> String {
        let start = DispatchTime.now()
        switch itemNumber {
        case 0:
            generateArrayOfInt()
        case 1:
            insertThousandIntAtTheBeginningOneByOne()
        case 2:
            insertThousandIntAtTheBeginningAtOnce()
        case 3:
            insertThousandIntInTheMiddleOneByOne()
        case 4:
            insertThousandIntInTheMiddleAtOnce()
        case 5:
            appendThousandIntOneByOne()
        case 6:
            appendThousandIntAtOnce()
        default: break
        }
        let end = DispatchTime.now()
        let nanoseconds = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoseconds) / 1_000_000_000
        return "\(String(format: "%.3f", timeInterval)) ms"
    }

    func generateRandomInt() {
        self.randomInt = Int.random(in: 1...10_000_000)
    }

    private func generateArrayOfInt() {
        for int in 0...9_999_999 {
            arrayOfInt.append(int)
        }
    }

    private func insertThousandIntAtTheBeginningOneByOne() {
        for int in 0...999 {
            arrayOfInt.insert(int, at: 0)
        }
    }

    private func insertThousandIntAtTheBeginningAtOnce() {
        arrayOfInt.insert(contentsOf: arrayOfThousandInt, at: 0)
    }

    private func insertThousandIntInTheMiddleOneByOne() {
        for int in 0...999 {
            arrayOfInt.insert(int, at: arrayOfInt.count / 2)
        }
    }

    private func insertThousandIntInTheMiddleAtOnce() {
        arrayOfInt.insert(contentsOf: arrayOfThousandInt, at: arrayOfInt.count / 2)
    }

    private func appendThousandIntOneByOne() {
        for int in 0...999 {
            arrayOfInt.append(int)
        }
    }

    private func appendThousandIntAtOnce() {
        arrayOfInt.append(contentsOf: arrayOfThousandInt)
    }
}
