//
//  CollectionsModel.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 06/10/2021.
//

import Foundation

class CollectionsModel {

    var randomInt = Int()

    func generateRandomInt() {
        self.randomInt = Int.random(in: 1...10_000)
    }

    func generateArrayOfInt() -> String {
        var arrayOfInt = [Int]()
        let start = DispatchTime.now()
        for int in 0...9_999_999 {
            arrayOfInt.append(int)
        }
        let end = DispatchTime.now()
        let nanoseconds = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoseconds) / 1_000_000_000
        return "\(String(format: "%.2f", timeInterval)) ms"
    }
}
