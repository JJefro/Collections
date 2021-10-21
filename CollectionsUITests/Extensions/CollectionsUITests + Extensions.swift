//
//  CollectionsUITests + Extensions.swift
//  CollectionsUITests
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import Foundation
import XCTest

extension XCUIApplication {

    var isOnMainView: Bool {
        return otherElements["mainView"].exists
    }

    var isOnArrayView: Bool {
        return otherElements["arrayView"].exists
    }

    var isOnSetView: Bool {
        return otherElements["setView"].exists
    }

    var isOnDictionaryView: Bool {
        return otherElements["dictionaryView"].exists
    }
}
