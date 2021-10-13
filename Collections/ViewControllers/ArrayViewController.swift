//
//  ArrayViewController.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit

class ArrayViewController: UIViewController {

    var collectionView: UICollectionView!
    private let model = ArrayModel()
    var dataSource = CollectionViewDataSource()

    let lineSpacing: CGFloat = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        bind()
        self.navigationItem.largeTitleDisplayMode = .never
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        model.generateRandomInt()
        title = "Array: \(model.randomInt)"
    }
}
