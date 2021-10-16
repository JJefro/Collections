//
//  SetViewModel.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 16/10/2021.
//

import Foundation

struct SetViewModel {

    func findAllMatchingLetters(firstInput: String, secondInput: String) -> String {
        return String( Array(firstInput).filter({secondInput.contains($0)}) )
    }

    func findUnmathingLetters(input: String, unmatch: String) -> String {
        return String( Array(input).filter({!unmatch.contains($0)}) )
    }

    func findUniqueLetters(input: String, secondInput: String) -> String {
        var result = String()
        for char in Array(input) {
            if Array(input).filter({ $0 == char}).count == 1,
               Array(secondInput).filter({ $0 == char}).isEmpty {
                result.append(char)
            }
        }
        return result
    }
}
