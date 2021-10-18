//
//  CustomCollectionViewCell.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 08/10/2021.
//

import UIKit
import SnapKit
import NVActivityIndicatorView

class ArrayVCollectionViewCell: UICollectionViewCell {

    static let identifier = "ArrayVCollectionViewCell"

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
        createConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateCell(item: ArrayOperation) {
        item.isPerforming ? spinner.startAnimating() : spinner.stopAnimating()
        textLabel.isHidden = item.isPerforming
        textLabel.text = item.title
    }

    private func createConstraints() {

        spinner.snp.makeConstraints { make in
            make.center.equalTo(contentView)
            make.height.width.equalTo(30)
        }

        textLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
