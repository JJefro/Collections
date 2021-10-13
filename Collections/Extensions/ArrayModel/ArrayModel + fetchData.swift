//
//  ArrayModel + fetchData.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 13/10/2021.
//

import Foundation

extension ArrayModel {
    func fetchData() -> [ArrayOperation] {
        let oper1 = ArrayOperation(title: "Insert at the beginning of an array 1000 elements one-by-one")
        let oper2 = ArrayOperation(title: "Insert at the beginning of an array 1000 elements at once")
        let oper3 = ArrayOperation(title: "Insert in the middle of an array 1000 elements one-by-one")
        let oper4 = ArrayOperation(title: "Insert in the middle of an array 1000 elements at once")
        let oper5 = ArrayOperation(title: "Append to the end of an array 1000 elements one-by-one")
        let oper6 = ArrayOperation(title: "Append to the end of an array 1000 elements at once")
        let oper7 = ArrayOperation(title: "Remove at the beginning 1000 elements one-by-one")
        let oper8 = ArrayOperation(title: "Remove at the beginning 1000 elements at once")
        let oper9 = ArrayOperation(title: "Remove in the middle 1000 elements one-by-one")
        let oper10 = ArrayOperation(title: "Remove in the middle 1000 elements at once")
        let oper11 = ArrayOperation(title: "Remove at the end 1000 elements one-by-one")
        let oper12 = ArrayOperation(title: "Remove at the end 1000 elements at once")

        return [oper1, oper2, oper3, oper4, oper5, oper6, oper7, oper8, oper9, oper10, oper11, oper12]
    }
}
