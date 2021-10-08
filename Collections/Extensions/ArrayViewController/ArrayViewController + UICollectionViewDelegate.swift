//
//  ArrayViewController + UICollectionViewDelegate.swift
//  Collections
//
//  Created by Jevgenijs Jefrosinins on 09/10/2021.
//

import Foundation
import UIKit

extension ArrayViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = CGFloat()
        let height: CGFloat = view.frame.size.height / 9
        if indexPath.item == 0 {
            width = view.frame.size.width
        } else {
            width = (view.frame.size.width - lineSpacing) / numberOfColumns
        }
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell

        return cell
    }
}
