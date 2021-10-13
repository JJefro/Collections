//
//  ArrayViewController + UICollectionViewDelegate.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 09/10/2021.
//

import UIKit
import SnapKit

extension ArrayViewController {

    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = layout.minimumLineSpacing
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.register(
            CollectionViewCell.self,
            forCellWithReuseIdentifier: CollectionViewCell.identifier)
        makeConstraints()
    }

    func bind() {
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource
    }

    private func makeConstraints() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
