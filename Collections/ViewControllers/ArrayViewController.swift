//
//  ArrayViewController.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 05/10/2021.
//

import UIKit

class ArrayViewController: UIViewController {

    var collectionView: UICollectionView?

    var model = CollectionsModel()

    let lineSpacing: CGFloat = 1
    let numberOfColumns: CGFloat = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        self.navigationItem.largeTitleDisplayMode = .never
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        model.generateRandomInt()
        title = "Array: \(model.randomInt)"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = model.generateArrayOfInt()
    }

    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = lineSpacing
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)

        guard let collectionView = collectionView else {return}
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            CollectionViewCell.self,
            forCellWithReuseIdentifier: CollectionViewCell.identifier)

        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .black
    }
}
