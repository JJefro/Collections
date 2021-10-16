//
//  ArrayViewController + FetchData.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 13/10/2021.
//

import UIKit

extension ArrayViewController {

    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = layout.minimumLineSpacing
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        collectionView.backgroundColor = R.color.collectionViewBackground()
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
