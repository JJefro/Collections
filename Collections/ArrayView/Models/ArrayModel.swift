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

    private var arrayOfInt = [Int]()
    private let arrayOfThousandInt = Array(0...999)
    var performingOperations = 0

    init() {
        let operation = fetchData()
        data.append(contentsOf: operation)
    }

    func appendData() {
        operations.append(contentsOf: data)
    }

    func updateTitle(at cellNumber: Int) {
            switch cellNumber {
            case 0:
                operations[cellNumber].title = "Array creation time: \(performOperation(at: cellNumber))"
            case 1..<7:
                operations[cellNumber].title = "Insertion time: \(performOperation(at: cellNumber))"
            case 7...12:
                operations[cellNumber].title = "Removing time: \(performOperation(at: cellNumber))"
            default: break
            }
    }

    private func performOperation(at cellNumber: Int) -> String {
        performingOperations += 1
        let start = DispatchTime.now()
            switch cellNumber {
            case 0:
                generateArrayOfIntOneByOne()
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
            case 7:
                removeThousandIntAtTheBeginningOneByOne()
            case 8:
                removeThousandIntAtTheBeginningAtOnce()
            case 9:
                removeThousandIntInTheMiddleOneByOne()
            case 10:
                removeThousandIntInTheMiddleAtOnce()
            case 11:
                removeThousandIntInTheEndOneByOne()
            case 12:
                removeThousandIntInTheEndAtOnce()
            default: break
        }
        let end = DispatchTime.now()
        let nanoseconds = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoseconds) / 1_000_000_000
        performingOperations -= 1
        return "\(String(format: "%.3f", timeInterval)) ms"
    }

    // MARK: - Array Operations
    private func generateArrayOfIntOneByOne() {
        var array = [Int]()
        for int in 0...9_999_999 {
            array.append(int)
        }
        arrayOfInt = array
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

    private func removeThousandIntAtTheBeginningOneByOne() {
        for _ in 0...999 {
            arrayOfInt.removeFirst()
        }
    }

    private func removeThousandIntAtTheBeginningAtOnce() {
        arrayOfInt.removeFirst(1000)
    }

    private func removeThousandIntInTheMiddleOneByOne() {
        for _ in 0...999 {
            arrayOfInt.remove(at: arrayOfInt.count / 2)
        }
    }

    private func removeThousandIntInTheMiddleAtOnce() {
        let range = ((arrayOfInt.count / 2) - 500)..<((arrayOfInt.count / 2) + 500)
        arrayOfInt.removeSubrange(range)
    }

    private func removeThousandIntInTheEndOneByOne() {
        for _ in 0...999 {
            arrayOfInt.removeLast()
        }
    }

    private func removeThousandIntInTheEndAtOnce() {
        arrayOfInt.removeLast(1000)
    }
}
