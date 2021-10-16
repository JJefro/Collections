//
//  CustomButton.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 14/10/2021.
//

import Foundation
import UIKit

class CustomButton: CardButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.setTitleColor(R.color.blue(), for: .normal)
        self.titleLabel?.font = R.font.sfProDisplayRegular(size: 20)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
