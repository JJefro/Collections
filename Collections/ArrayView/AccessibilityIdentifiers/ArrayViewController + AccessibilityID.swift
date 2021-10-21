//
//  ArrayViewController + AccessibilityID.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import Foundation

extension ArrayViewController {

    func createAccessibilityIdentifiers() {
        collectionView.accessibilityIdentifier = ArrayViewAccessibilityID.collectionView
        view.accessibilityIdentifier = ArrayViewAccessibilityID.arrayView
    }
}

struct ArrayViewAccessibilityID {
    static let collectionView = "ArrayView_CollectionView"
    static let activityIndicator = "ArrayView_CellActivityIndicator"
    static let arrayView = "arrayView"
    static let cellTextLabel = "cellTextLabel_ArrayVCollectionViewCell"
}
