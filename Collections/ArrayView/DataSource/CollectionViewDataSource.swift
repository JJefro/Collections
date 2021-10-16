//
//  CollectionViewDataSource.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 12/10/2021.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var model = ArrayModel()

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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        let itemData = model.operations[indexPath.row]
        cell.updateCell(item: itemData)

        cell.backgroundColor = !model.operations[indexPath.row].isDone ? R.color.gray() : R.color.lightGray()
        cell.textLabel.textColor = !model.operations[indexPath.row].isDone ? R.color.blue() : R.color.textColor()

        return cell
    }

    // MARK: UICollectionView Delegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if model.performingOperations < 2 {
            model.operations[indexPath.row].isPerforming.toggle()
            let processingQueue = DispatchQueue(label: "jjefro.heavyProccessingQueue", qos: .userInitiated, attributes: .concurrent)

            processingQueue.async { [self] in
                model.updateTitle(at: indexPath.item)
                DispatchQueue.main.async {
                    if model.operations[0].isDone, model.operations.count == 1 {
                        model.appendData()
                    }
                    collectionView.reloadData()
                }
            }
            collectionView.reloadData()
        }
    }
}
