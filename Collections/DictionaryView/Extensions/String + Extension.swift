//
//  String + Extension.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 18/10/2021.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
