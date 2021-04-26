//
//  InfoCollection.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/23.
//

import Foundation
import UIKit

class InfoCollection: NSObject{
    private var myInfo = MyInfo()
    public var myInfo_: MyInfo{
        get{
            return myInfo
        }set(val){
            myInfo = val
        }
    }
    
}

extension InfoCollection: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "info", for: indexPath) as! InfoCell
            cell.awakeFromNib()
            cell.setUIDatas(myInfo)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "aboutMedi", for: indexPath) as! AboutMediCell
            cell.awakeFromNib()
            if indexPath.row == 2{
                cell.pointLabel.isHidden = false
            }
            cell.setUIDatas(myInfo,indexPath.row - 1)
            return cell
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // cell 사이즈( 옆 라인을 고려하여 설정 )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0{
            let size = CGSize(width: (collectionView.frame.width), height: (collectionView.frame.height - 100))
            return size
        }else{
            let size = CGSize(width: (collectionView.frame.width), height: 45)
            return size
        }
    }
    
}
