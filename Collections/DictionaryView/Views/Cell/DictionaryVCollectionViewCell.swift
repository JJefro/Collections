//
//  DictionaryVCollectionViewCell.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 18/10/2021.
//

import SnapKit
import NVActivityIndicatorView
import UIKit

class DictionaryVCollectionViewCell: UICollectionViewCell {

    static let identifier = "DictionaryVCollectionViewCell"

    var spinner = NVActivityIndicatorView(
            frame: .zero,
            type: .pacman,
            color: UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black,
            padding: 0
        )

    let textLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.sfProDisplayRegular(size: 17)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(textLabel)
        contentView.addSubview(spinner)
        contentView.clipsToBounds = true
        createCellElementsConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createAccessibilityIdentifiers()
    }

    func updateCell(item: ArrayOperation) {
        item.isPerforming ? spinner.startAnimating() : spinner.stopAnimating()
        textLabel.isHidden = item.isPerforming
        textLabel.text = item.title
    }

    private func createAccessibilityIdentifiers() {
        spinner.accessibilityIdentifier = DictionaryViewAccessibilityID.cellActivityIndicator
        textLabel.accessibilityIdentifier = DictionaryViewAccessibilityID.cellTextLabel
    }

    private func createCellElementsConstraints() {

        spinner.snp.makeConstraints { make in
            make.center.equalTo(contentView)
            make.height.width.equalTo(30)
        }
        textLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
