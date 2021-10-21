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
    private let model = ArrayViewModel()
    var dataSource = ArrayVCollectionViewDataSource()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.leftBarButtonItem?.isAccessibilityElement = true
        view.backgroundColor = R.color.arrayViewBackground()
        configureCollectionView()
        createAccessibilityIdentifiers()
    }
}
