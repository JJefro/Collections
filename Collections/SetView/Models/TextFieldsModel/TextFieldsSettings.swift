//
//  TextFieldsModel.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 22/09/2021.
//

import Foundation
import UIKit

enum TextFieldsSettings {
    case onlyLetters
    case inputLimit
    case onlyCharacters
    case link
    case validationRules

    var title: String {
        switch self {
        case .onlyLetters:
            return "Only Letters"
        case .inputLimit:
            return "Input limit"
        case .onlyCharacters:
            return "Only characters"
        case .link:
            return "Link"
        case .validationRules:
            return "Validation rules"
        }
    }
    var placeholder: String {
        switch self {
        case .onlyLetters:
            return "Type here"
        case .inputLimit:
            return "Type here"
        case .onlyCharacters:
            return "wwwww-ddddd"
        case .link:
            return "www.example.com"
        case .validationRules:
            return "Password"
        }
    }
}
