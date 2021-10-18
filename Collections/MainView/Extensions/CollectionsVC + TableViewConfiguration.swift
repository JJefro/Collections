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
        tableView.backgroundColor = view.backgroundColor
        tableView.rowHeight = 40
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        setTableViewConstraints()
    }

    func bind() {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }

    private func setTableViewConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
    }
}
