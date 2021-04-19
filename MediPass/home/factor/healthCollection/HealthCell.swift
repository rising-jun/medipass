//
//  HealthCell.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/19.
//

import Foundation
import UIKit
import SnapKit

class HealthCell: UICollectionViewCell{

    lazy var coverView: UIView = UIView()
    lazy var imageView: UIImageView = UIImageView()
    lazy var titleLabel: UILabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(coverView)
        
        coverView.snp.makeConstraints { (make) in
            make.width.equalTo(260)
            make.height.equalTo(220)
        }
        
        coverView.addSubViews(imageView, titleLabel)
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.3
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(coverView.snp.width)
            make.height.equalTo(170)
            make.top.equalTo(coverView.snp.top)
            make.centerX.equalTo(coverView)
        }
        
        titleLabel.font = titleLabel.font.withSize(14)
        titleLabel.minimumScaleFactor = 0.1
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom)
            make.height.equalTo(30)
            make.width.equalTo(imageView.snp.width)
            make.centerX.equalTo(coverView)
        }
        
    }
    
    
}

