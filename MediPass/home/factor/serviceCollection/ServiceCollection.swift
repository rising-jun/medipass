//
//  ServiceCollection.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/16.
//

import Foundation
import UIKit

class ServiceCollection: NSObject{
    public var cellArr: [ServiceCellInfo] = []
    
    
}

extension ServiceCollection: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Service", for: indexPath) as! ServiceCell
        
        cell.imageView.image = cellArr[indexPath.row].image_
        cell.titleLabel.text = cellArr[indexPath.row].title_
        cell.awakeFromNib()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 2
       }

    
       // 옆 간격
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 1
       }

       // cell 사이즈( 옆 라인을 고려하여 설정 )
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = CGSize(width: (collectionView.frame.width / 3) - 10, height: (collectionView.frame.height / 2) - 5)
           return size
       }
    
}
