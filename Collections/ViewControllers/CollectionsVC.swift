//
//  CollectionsVC.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit
import NVActivityIndicatorView

class CollectionsVC: UIViewController {

    var tableView = UITableView()
    var collections: [Collection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collections"
        collections = fetchData()
        configureTableView()
    }

}
