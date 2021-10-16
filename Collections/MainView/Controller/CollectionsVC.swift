//
//  CollectionsVC.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit

class CollectionsVC: UIViewController {

    var tableView = UITableView()
    var model = CollectionsModel()
    var dataSource = TableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collections"
        dataSource.objects = fetchData()
        configureTableView()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        model.generateRandomInt()
        dataSource.randomInt = model.randomInt
    }
}
