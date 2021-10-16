//
//  ResultLabel.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 15/10/2021.
//

import Foundation
import UIKit
import SnapKit

class ResultLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = R.font.sfProDisplayRegular(size: 17)
        self.textAlignment = .center
        self.numberOfLines = 0
        self.textColor = R.color.tfTextColor()
        self.backgroundColor = .clear
        self.text = ""
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
