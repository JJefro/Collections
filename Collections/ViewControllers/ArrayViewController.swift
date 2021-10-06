//
//  ArrayViewController.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit

class ArrayViewController: UIViewController {

    private var model = CollectionsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.navigationItem.largeTitleDisplayMode = .never
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        model.generateRandomInt()
        title = "Array: \(model.randomInt)"
    }
}
