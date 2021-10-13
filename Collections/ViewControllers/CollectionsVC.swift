//
//  CollectionsVC.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit

class CollectionsVC: UIViewController {

    var tableView = UITableView()
    var dataSource = TableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collections"
        dataSource.objects = fetchData()
        configureTableView()
        bind()
    }
}
