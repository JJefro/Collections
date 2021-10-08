//
//  CollectionViewCell.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 09/10/2021.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {

    static let identifier = "CustomCollectionViewCell"

    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Int array with 10_000_000 elements"
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray
        contentView.addSubview(textLabel)
        contentView.clipsToBounds = true
        createTextLabelConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createTextLabelConstraints() {
        textLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
            make.centerY.centerX.equalTo(contentView)
        }
    }
}
