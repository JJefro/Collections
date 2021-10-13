//
//  SetViewController.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit

class SetViewController: UIViewController {

    private let model = ArrayModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.navigationItem.largeTitleDisplayMode = .never
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        model.generateRandomInt()
        title = "Set: \(model.randomInt)"
    }
}
