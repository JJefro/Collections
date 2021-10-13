//
//  TableViewDataSource.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 13/10/2021.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    var objects: [Collection] = []

    private func getNavController() -> UINavigationController? {
        let keywindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        return keywindow?.rootViewController as? UINavigationController
    }

    // MARK: - UITableviewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController = UIViewController()
        let navController = getNavController()

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
        navController?.pushViewController(viewController, animated: true)
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as! TableViewCell
        let object = objects[indexPath.row]
        cell.set(collection: object)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
