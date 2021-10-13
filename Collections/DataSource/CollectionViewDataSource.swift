//
//  CollectionViewDataSource.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 13/10/2021.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var model = ArrayModel()

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 100)
        default:
            return CGSize(width: ((collectionView.frame.width/2)-1).rounded(.down), height: 100)
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

        cell.backgroundColor = !model.operations[indexPath.row].isDone ? UIColor.gray : UIColor.lightGray
        cell.textLabel.textColor = !model.operations[indexPath.row].isDone ? UIColor.blue : UIColor.black

        return cell
    }

    // MARK: UICollectionView Delegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        model.operations[indexPath.row].isPerforming.toggle()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [self] in
            model.updateTitle(at: indexPath.item)
            collectionView.reloadItems(at: [indexPath])
        }
        if model.operations.count == 1 {
            model.appendData()
        }
        collectionView.reloadData()
    }
}
