//
//  CollectionsVC + UITableViewDataSource.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import Foundation
import UIKit

extension CollectionsVC: UITableViewDataSource, UITableViewDelegate {

    // MARK: - UITableviewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController = UIViewController()

        switch indexPath.row {
        case 0:
            viewController = ArrayViewController()
        case 1:
            viewController = SetViewController()
        case 2:
            viewController = DictionaryViewController()
        default: break
        }
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        let collection = collections[indexPath.row]
        cell.set(collection: collection)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
