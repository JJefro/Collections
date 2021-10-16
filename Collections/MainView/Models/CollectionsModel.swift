//
//  CollectionsModel.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 14/10/2021.
//

import Foundation

class CollectionsModel {

    var randomInt = Int()

    func generateRandomInt() {
        self.randomInt = Int.random(in: 1...10_000_000)
    }
}
