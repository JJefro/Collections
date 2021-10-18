//
//  CollectionViewDataSource.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 12/10/2021.
//

import UIKit

class ArrayVCollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var model = ArrayModel()
    private let processingQueue = DispatchQueue(label: "heavyProccessingQueue", qos: .userInitiated, attributes: .concurrent)

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height / 8
        switch indexPath.item {
        case 0:
            return CGSize(width: collectionView.frame.width, height: height)
        default:
            return CGSize(width: ((collectionView.frame.width/2)-1).rounded(.down), height: height)
        }
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.operations.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArrayVCollectionViewCell.identifier, for: indexPath) as! ArrayVCollectionViewCell

        let itemData = model.operations[indexPath.row]
        cell.updateCell(item: itemData)

        cell.backgroundColor = !model.operations[indexPath.row].isDone ? R.color.arrayViewCell() : R.color.arrayViewCell()?.withAlphaComponent(0.6)
        cell.textLabel.textColor = !model.operations[indexPath.row].isDone ? R.color.blue() : R.color.arrayViewText()
        cell.layer.cornerRadius = 25

        return cell
    }

    // MARK: UICollectionView Delegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if model.performingOperations < 1 {
            model.operations[indexPath.row].isPerforming.toggle()

            processingQueue.async { [self] in
                model.updateTitle(at: indexPath.item)
                if model.operations[0].isDone, model.operations.count == 1 {
                    model.appendData()
                }
                DispatchQueue.main.async {
                    collectionView.reloadData()
                }
            }
            collectionView.reloadData()
        }
    }
}
