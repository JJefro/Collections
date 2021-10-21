//
//  SetViewController + AccessibilityID.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 21/10/2021.
//

import Foundation

extension SetViewController {

    func createAccessibilityIdentifiers() {
        view.accessibilityIdentifier = SetViewAccessibilityID.view
        stackView.accessibilityIdentifier = SetViewAccessibilityID.stackView
        topTextField.txtField.accessibilityIdentifier = SetViewAccessibilityID.topTextField
        bottomTextField.txtField.accessibilityIdentifier = SetViewAccessibilityID.bottomTextField
        firstButton.accessibilityIdentifier = SetViewAccessibilityID.firstButton
        middleButton.accessibilityIdentifier = SetViewAccessibilityID.middleButton
        lastButton.accessibilityIdentifier = SetViewAccessibilityID.lastButton
        firstLabel.accessibilityIdentifier = SetViewAccessibilityID.firstLabel
        middleLabel.accessibilityIdentifier = SetViewAccessibilityID.middleLabel
        lastLabel.accessibilityIdentifier = SetViewAccessibilityID.lastLabel
    }
}

struct SetViewAccessibilityID {
    static let view = "setView"
    static let stackView = "stackView_SetView"
    static let topTextField = "topTextField_SetView"
    static let bottomTextField = "bottomTextField_SetView"
    static let firstButton = "firstButton_SetView"
    static let middleButton = "middleButton_SetView"
    static let lastButton = "lastButton_SetView"
    static let firstLabel = "firstLabel_SetView"
    static let middleLabel = "middleLabel_SetView"
    static let lastLabel = "lastLabel_SetView"
}
