//
//  CollectionVC + FetchData.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import Foundation

extension MainViewController {

    func fetchData() -> [Collection] {
        let collection1 = Collection(title: "Array")
        let collection2 = Collection(title: "Set")
        let collection3 = Collection(title: "Dictionary")

        return [collection1, collection2, collection3]
    }
}
