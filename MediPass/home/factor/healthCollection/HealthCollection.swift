//
//  HealthCollection.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/19.
//

import Foundation
import UIKit

class HealthCollection: NSObject{
    public var cellArr: [HealthCellInfo] = []
    
}

extension HealthCollection: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "health", for: indexPath) as! HealthCell
        
        cell.imageView.image = cellArr[indexPath.row].image_
        cell.titleLabel.text = cellArr[indexPath.row].title_
        cell.awakeFromNib()
        return cell
    }
    
       // 옆 간격
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 1
       }

       // cell 사이즈( 옆 라인을 고려하여 설정 )
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = CGSize(width: 260, height: (collectionView.frame.height))
           return size
       }
    
}
