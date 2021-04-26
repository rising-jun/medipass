//
//  AboutMediCell.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/26.
//

import Foundation
import UIKit
import SnapKit

class AboutMediCell: UICollectionViewCell{

    lazy var cellView = UIView()
    lazy var icon = UIImageView()
    lazy var mediLabel = UILabel()
    lazy var pointLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(cellView)
        
        cellView.addSubViews(icon, mediLabel, pointLabel)
        
        
        cellView.snp.makeConstraints { (make) in
            make.width.equalTo(contentView)
            make.height.equalTo(45)
            make.center.equalTo(contentView)
        }
        
        icon.snp.makeConstraints { (make) in
            make.leading.equalTo(cellView).offset(30)
            make.width.height.equalTo(20)
            make.centerY.equalTo(cellView)
        }
        
        mediLabel.text = "메디라벨입니다 ^^"
        mediLabel.font = mediLabel.font.withSize(15)
        mediLabel.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.centerY.equalTo(cellView)
            make.leading.equalTo(icon.snp.trailing).offset(20)
        }
        
        pointLabel.text = "1000p"
        pointLabel.isHidden = true
        pointLabel.font = pointLabel.font.withSize(15)
        pointLabel.textColor = .purple
        pointLabel.textAlignment = .right
        pointLabel.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.centerY.equalTo(cellView)
            make.trailing.equalTo(cellView.snp.trailing).offset(-30)
        }
        
        
    }
    
    
    public func setUIDatas(_ myInfo: MyInfo,_ row: Int){
        pointLabel.text = myInfo.point_
        icon.image = myInfo.iconArray_[row]
        mediLabel.text = myInfo.introArray_[row]
    }

}
