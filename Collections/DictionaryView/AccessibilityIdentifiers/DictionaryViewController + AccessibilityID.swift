//
//  DictionaryViewController + AccessibilityID.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import Foundation

extension DictionaryViewController {

    func createAccessibilityIdentifiers() {
        view.accessibilityIdentifier = DictionaryViewAccessibilityID.view
        collectionView.accessibilityIdentifier = DictionaryViewAccessibilityID.collectionView
        arrayLabel.accessibilityIdentifier = DictionaryViewAccessibilityID.arrayLabel
        dictionaryLabel.accessibilityIdentifier = DictionaryViewAccessibilityID.dictionaryLabel
        stackView.accessibilityIdentifier = DictionaryViewAccessibilityID.stackView
        spinner.accessibilityIdentifier = DictionaryViewAccessibilityID.viewActivityIndicator
        loadingView.accessibilityIdentifier = DictionaryViewAccessibilityID.loadingView
    }
}

struct DictionaryViewAccessibilityID {
    static let view = "dictionaryView"
    static let collectionView = "collectionView_DictionaryView"
    static let arrayLabel = "arrayLabel_DictionaryView"
    static let dictionaryLabel = "dictionaryLabel_DictionaryView"
    static let stackView = "stackView_DistionaryView"
    static let cellActivityIndicator = "cellActivityIndicator_DictionaryVCollectionViewCell"
    static let cellTextLabel = "cellTextLabel_DictionaryVCollectionViewCell"
    static let viewActivityIndicator = "viewActivityIndicator_DictionaryViewController"
    static let loadingView = "loadingView_DictionaryViewController"
}
