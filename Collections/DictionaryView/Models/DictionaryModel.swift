//
//  DictionaryModel.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 18/10/2021.
//

import Foundation

class DictionaryModel {

    var operations: [ArrayOperation] = []
    var arrayWithContacts: [Contact] = []
    var dictionaryWithContacts: [String: String] = [:]

    private var currentContactName = String()

    init() {
        let operation = fetchData()
        operations.append(contentsOf: operation)
    }

    func updateTitle(at cellNumber: Int) {
        switch cellNumber {
        case 0...1:
            operations[cellNumber].title = "First element search time: \(performOperation(at: cellNumber)). Result name: \(currentContactName)"
        case 2...3:
            operations[cellNumber].title = "Last element search time: \(performOperation(at: cellNumber)). Result name: \(currentContactName)"
        case 4...5:
            operations[cellNumber].title = "Search time: \(performOperation(at: cellNumber))"
        default: break
        }
    }

    private func performOperation(at cellNumber: Int) -> String {
        let start = DispatchTime.now()
        switch cellNumber {
        case 0:
            findFirstContactInArray()
        case 1:
            findFirstContactInDictionary()
        case 2:
            findLastContactInArray()
        case 3:
            findLastContactInDictionary()
        case 4:
            searchNotExistingElementInArray()
        case 5:
            searchNotExistingElementInDictionary()
        default: break
        }
        let end = DispatchTime.now()
        let nanoseconds = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoseconds) / 1_000_000_000
        return "\(String(format: "%.3f", timeInterval)) ms"
    }

    private func findFirstContactInArray() {
        currentContactName = arrayWithContacts.first?.name ?? "Contact not found"
    }

    private func findFirstContactInDictionary() {
        currentContactName = dictionaryWithContacts.keys.sorted().first ?? "Contact not found"
    }

    private func findLastContactInArray() {
        currentContactName = arrayWithContacts.last?.name ?? "Contact not found"
    }

    private func findLastContactInDictionary() {
        currentContactName = dictionaryWithContacts.keys.sorted().last ?? "Contact not found"
    }

    private var name: String? = ""
    private func searchNotExistingElementInArray() {
        let element = "element"
        name = arrayWithContacts.first(where: { $0.name == element })?.name
    }

    private func searchNotExistingElementInDictionary() {
        let element = "element"
        name = dictionaryWithContacts.keys.first(where: { $0 == element })
    }

    func generateCollections() {
        var array = [Contact]()
        var dictionary = [String: String]()
        for number in 0...9_999_999 {
            array.append(Contact(name: "Name\(number)", phoneNumber: "\(number)"))
            dictionary["Name\(number)"] = "\(number)"
        }
        arrayWithContacts = array
        dictionaryWithContacts = dictionary
    }
    //    private func generateRandomString() -> String {
    //        let letters = "abcdefghijklmnopqrstuvwxyz"
    //        let length = Int.random(in: 4...10)
    //        return String((0..<length).map({ _ in letters.randomElement()! })).capitalizingFirstLetter()
    //    }

    //    private func generateRandomNumber() -> String {
    //        let numbers = "0123456789"
    //        let length = Int.random(in: 7...10)
    //        return String((0..<length).map({ _ in numbers.description.randomElement()! }))
    //    }
}
