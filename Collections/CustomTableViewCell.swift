//
//  CollectionCell.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"

    var collectionTitleLabel = UILabel()
    var collection = Collection()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionTitleLabel)
        configureTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(collection: Collection) {
        collectionTitleLabel.text = collection.title
    }

    func configureTitleLabel() {
        collectionTitleLabel.numberOfLines = 0
        collectionTitleLabel.adjustsFontSizeToFitWidth = true
        setTitleLabelConstraints()
    }

    func setTitleLabelConstraints() {
        collectionTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(self).inset(20)
        }
    }
}
