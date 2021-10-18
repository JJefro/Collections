//
//  ArrayViewController.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit
import SnapKit

class ArrayViewController: UIViewController {

    var collectionView: UICollectionView!
    private let model = ArrayModel()
    var dataSource = ArrayVCollectionViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = R.color.arrayViewBackground()
        configureCollectionView()
    }
}
