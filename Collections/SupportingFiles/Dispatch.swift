//
//  Dispatch.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 19/10/2021.
//

import Foundation

enum Dispatch {
    case background
    case processing

    var queue: DispatchQueue {
        switch self {
        case .background:
            return DispatchQueue(label: "backgroundProcessingQueue", qos: .background, attributes: .concurrent)
        case .processing:
            return DispatchQueue(label: "heavyProccessingQueue", qos: .userInitiated, attributes: .concurrent)
        }
    }
}
