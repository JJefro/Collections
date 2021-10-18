//
//  DictionaryViewController + UICollectionViewDataSource.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 18/10/2021.
//

import Foundation
import UIKit

extension DictionaryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(
            width: ((collectionView.frame.width/2)-1).rounded(.down),
            height: collectionView.frame.size.height / 8)
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.operations.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DictionaryVCollectionViewCell.identifier, for: indexPath) as! DictionaryVCollectionViewCell

        let cellData = model.operations[indexPath.row]
        cell.updateCell(item: cellData)

        cell.backgroundColor = !model.operations[indexPath.row].isDone ? R.color.dictionaryViewCell() : R.color.dictionaryViewCell()?.withAlphaComponent(0.6)
        cell.textLabel.textColor = !model.operations[indexPath.row].isDone ? R.color.blue() : R.color.dictionaryViewTextColor()
        cell.layer.cornerRadius = 25

        return cell
    }

    // MARK: - UICollectionView Delegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        model.operations[indexPath.item].isPerforming.toggle()
        processingQueue.async { [self] in
            model.updateTitle(at: indexPath.item)
            DispatchQueue.main.async {
                collectionView.reloadData()
            }
        }
        collectionView.reloadData()
    }
}
