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
        operations = fetchData()
    }

    func performOperation(at indexPath: IndexPath, completion: @escaping() -> Void) {
        operations[indexPath.item].isPerforming.toggle()
        Dispatch.processing.queue.async { [self] in
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

    func generateCollections(completion: @escaping() -> Void) {
        Dispatch.processing.queue.async {
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
}
