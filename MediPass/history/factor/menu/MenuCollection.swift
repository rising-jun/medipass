//
//  MenuCollection.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/22.
//

import Foundation
import UIKit
class MenuCollection: NSObject {
    var menuArr: [String] = ["청구", "예약"]
    var pager: UICollectionView!
    var highlightView: UIView!
    var view: UIView!
    private let firstIndexPath = IndexPath(item: 0, section: 0)
}

extension MenuCollection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.setTitle(title: menuArr[indexPath.row])
        cell.menuLabel.textAlignment = .center
        
        cell.menuLabel.snp.updateConstraints { (make) in
            make.width.equalTo(414 / menuArr.count)
        }
        cell.awakeFromNib()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / CGFloat(menuArr.count) - 10
        return CGSize(width: width, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCell
        pager.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        UIView.animate(withDuration: 0.1) {
            self.highlightView.snp.remakeConstraints{ (make) in
                make.top.equalTo(collectionView.snp.bottom)
                make.width.equalTo(cell.snp.width)
                make.height.equalTo(3)
            }
            self.view.layoutIfNeeded()
        }
    }
}
