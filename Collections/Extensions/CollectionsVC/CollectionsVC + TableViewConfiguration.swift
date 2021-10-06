//
//  CollectionsVC + UITableViewDelegate.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import Foundation
import UIKit
import SnapKit

extension CollectionsVC {

    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 40
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.register(CollectionCell.self, forCellReuseIdentifier: Cells.collectionCell)
        setTableViewConstraints()
    }

    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setTableViewConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
    }
}
