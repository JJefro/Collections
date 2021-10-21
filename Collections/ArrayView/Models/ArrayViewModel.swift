//
//  CollectionsModel.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 06/10/2021.
//

import Foundation

class ArrayViewModel {

    private let arrayModelBackgroundQueue = DispatchQueue(
        label: "com.jjefro.arrayModelBackgroundQueue", qos: .background, attributes: .concurrent)
    private let arrayModelProcessingQueue = DispatchQueue(
        label: "com.jjefro.arrayModelProccessingQueue", qos: .userInitiated, attributes: .concurrent)

    var operations: [ArrayOperation] = [] {
        didSet {
            arrayModelBackgroundQueue.sync {
                if operations[0].isDone, operations.count == 1 {
                    let data = fetchData()
                    operations.append(contentsOf: data)
                }
                performingOperations = operations.filter({ $0.isPerforming == true }).count
            }
        }
    }

    private var arrayOfInt = [Int]()
    private let arrayOfThousandInt = Array(0...999)
    private(set) var performingOperations = 0

    init() {
        operations = [ArrayOperation(title: "Create Int array with 10_000_000 elements")]
    }

    func performOperation(at indexPath: IndexPath, completion: @escaping() -> Void) {
        operations[indexPath.item].isPerforming.toggle()
        arrayModelProcessingQueue.async { [self] in
            let start = DispatchTime.now()
            switch indexPath.item {
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
            DispatchQueue.main.async {
                updateTitle(at: indexPath, result: "\(String(format: "%.3f", timeInterval)) ms")
                completion()
            }
        }
    }

    private func updateTitle(at indexPath: IndexPath, result: String) {
        switch indexPath.item {
        case 0:
            operations[indexPath.item].title = "Array creation time: \(result)"
        case 1..<7:
            operations[indexPath.item].title = "Insertion time: \(result)"
        case 7...12:
            operations[indexPath.item].title = "Removing time: \(result)"
        default: break
        }
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
