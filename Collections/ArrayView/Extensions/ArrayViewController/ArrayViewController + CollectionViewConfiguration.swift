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
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = layout.minimumLineSpacing
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        collectionView.backgroundColor = view.backgroundColor
        collectionView.register(
            ArrayVCollectionViewCell.self,
            forCellWithReuseIdentifier: ArrayVCollectionViewCell.identifier)
        makeCollectionViewConstraints()
        bind()
    }

    func bind() {
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource
    }

    private func makeCollectionViewConstraints() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
