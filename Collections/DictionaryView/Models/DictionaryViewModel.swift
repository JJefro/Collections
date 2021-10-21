//
//  DictionaryViewModel.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 18/10/2021.
//

import Foundation

class DictionaryViewModel {

    private let dictModelProcessingQueue = DispatchQueue(
        label: "com.jjefro.dictModelProccessingQueue", qos: .userInitiated, attributes: .concurrent)
    private let dictModelBackgroundQueue = DispatchQueue(
        label: "com.jjefro.dictModelBackgroundQueue", qos: .background, attributes: .concurrent)

    var operations: [ArrayOperation] = []

    var dictionaryWithContacts: [String: String] = [:]
    var arrayWithContacts: [Contact] = [] {
        didSet {
            dictModelBackgroundQueue.sync {
                firstContactName = arrayWithContacts.first!.name
                lastContactName = arrayWithContacts.last!.name
            }
        }
    }

    private var currentContactName = String()
    private var firstContactName = String()
    private var lastContactName = String()

    init() {
        operations = fetchData()
    }

    func generateCollections(completion: @escaping() -> Void) {
        dictModelProcessingQueue.async {
            var array = [Contact]()
            var dictionary = [String: String]()
            for number in 0...9_999_999 {
                array.append(Contact(name: "Name\(number)", phoneNumber: "\(number)"))
                dictionary["Name\(number)"] = "\(number)"
            }
            DispatchQueue.main.async { [self] in
                arrayWithContacts = array
                dictionaryWithContacts = dictionary
                completion()
            }
        }
    }

    func performOperation(at indexPath: IndexPath, completion: @escaping() -> Void) {
        operations[indexPath.item].isPerforming.toggle()
        dictModelProcessingQueue.async { [self] in
            let start = DispatchTime.now()
            switch indexPath.item {
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
            DispatchQueue.main.async {
                updateTitle(at: indexPath, result: "\(String(format: "%.3f", timeInterval)) ms")
                completion()
            }
        }
    }

    private func updateTitle(at indexPath: IndexPath, result: String) {
        switch indexPath.item {
        case 0...1:
            operations[indexPath.item].title = "First element search time: \(result). Result name: \(currentContactName)"
        case 2...3:
            operations[indexPath.item].title = "Last element search time: \(result). Result name: \(currentContactName)"
        case 4...5:
            operations[indexPath.item].title = "Search time: \(result)"
        default: break
        }
    }

    private func findFirstContactInArray() {
        if arrayWithContacts.contains(where: { $0.name == firstContactName }) {
            currentContactName = firstContactName
        }
    }

    private func findFirstContactInDictionary() {
        if dictionaryWithContacts.keys.contains(where: { $0 == firstContactName }) {
            currentContactName = firstContactName
        }
    }

    private func findLastContactInArray() {
        if arrayWithContacts.contains(where: { $0.name == lastContactName }) {
            currentContactName = lastContactName
        }
    }

    private func findLastContactInDictionary() {
        if dictionaryWithContacts.keys.contains(where: { $0 == lastContactName }) {
            currentContactName = lastContactName
        }

    }

    private func searchNotExistingElementInArray() {
        let element = "element"
        _ = arrayWithContacts.first(where: { $0.name == element })?.name
    }

    private func searchNotExistingElementInDictionary() {
        let element = "element"
        _ = dictionaryWithContacts.keys.first(where: { $0 == element })
    }
}
