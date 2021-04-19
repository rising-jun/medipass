//
//  ServiceCell.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/16.
//

import Foundation
import UIKit
import SnapKit

class ServiceCell: UICollectionViewCell{

    lazy var coverView: UIView = UIView()
    lazy var imageView: UIImageView = UIImageView()
    lazy var titleLabel: UILabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(coverView)
        
        coverView.snp.makeConstraints { (make) in
            make.width.equalTo(110)
            make.height.equalTo(130)
        }
        coverView.addSubViews(imageView, titleLabel)
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.top.equalTo(coverView.snp.top).offset(20)
            make.centerX.equalTo(coverView)
        }
        
        titleLabel.minimumScaleFactor = 0.1
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(imageView.snp.width)
            make.centerX.equalTo(coverView)
        }
        
    }
    
    
}
