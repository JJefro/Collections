//
//  CollectionsVC.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit

class MainViewController: UIViewController {

    var tableView = UITableView()
    var model = MainViewModel()
    var dataSource = TableViewDataSource()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collections"
        view.backgroundColor = R.color.mainViewBackground()
        dataSource.objects = fetchData()
        configureTableView()
        bind()
        createAccessibilityIdentifiers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        model.generateRandomInt()
        dataSource.randomInt = model.randomInt
    }
}
