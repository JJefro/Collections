//
//  ArrayOperation.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 13/10/2021.
//

import Foundation

struct ArrayOperation {
    var title: String {
        didSet {
            isPerforming = false
            isDone = true
        }
    }
    var isDone = false
    var isPerforming = false
}
