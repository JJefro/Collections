//
//  SetViewModel.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 16/10/2021.
//

import Foundation

struct SetViewModel {

    func findAllMatchingLetters(firstInput: String, secondInput: String) -> String {
        var result = String()
        let matchingElements = Set(firstInput).intersection(Set(secondInput))
        for char in firstInput {
            if matchingElements.contains(char) {
                result.append(char)
            }
        }
        return result
    }

    func findUnmathingLetters(firstInput: String, secondInput: String) -> String {
        var result = String()
        let difference = Set(firstInput).symmetricDifference(Set(secondInput))

        for char in firstInput {
            if difference.contains(char) {
                result.append(char)
            }
        }
        for char in secondInput {
            if difference.contains(char) {
                result.append(char)
            }
        }
        return result
    }

    func findUniqueLetters(firstInput: String, secondInput: String) -> String {
        let secondInputSet = Set(secondInput)
        var result = String()
        for char in firstInput {
            if firstInput.filter({ $0 == char }).count == 1, secondInputSet.filter({ $0 == char }).isEmpty {
                result.append(char)
            }
        }
        return result
    }
}
