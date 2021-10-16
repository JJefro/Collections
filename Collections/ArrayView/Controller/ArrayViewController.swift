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
    var dataSource = CollectionViewDataSource()

    let lineSpacing: CGFloat = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        configureCollectionView()
        bind()
    }
}
