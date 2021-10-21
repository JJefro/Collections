//
//  DictionaryModel + fetchData.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 18/10/2021.
//

import Foundation

extension DictionaryViewModel {

    func fetchData() -> [ArrayOperation] {
        let operation1 = ArrayOperation(title: "Find the first contact")
        let operation2 = ArrayOperation(title: "Find the first contact")
        let operation3 = ArrayOperation(title: "Find the last contact")
        let operation4 = ArrayOperation(title: "Find the last contact")
        let operation5 = ArrayOperation(title: "Search for a non-existing element")
        let operation6 = ArrayOperation(title: "Search for a non-existing element")

        return [operation1, operation2, operation3, operation4, operation5, operation6]
    }
}
