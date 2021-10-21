//
//  MainViewController + AccessibilityID.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import Foundation

extension MainViewController {

    func createAccessibilityIdentifiers() {
        view.accessibilityIdentifier = MainViewAccessibilityID.view
        tableView.accessibilityIdentifier = MainViewAccessibilityID.tableView
    }
}

struct MainViewAccessibilityID {

    static let view = "mainView"
    static let tableView = "CollectionVC_tableView"
    static let navigationBar = "navBar"
}
