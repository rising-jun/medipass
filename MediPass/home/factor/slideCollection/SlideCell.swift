//
//  SlideCell.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/20.
//

import Foundation
import UIKit
import SnapKit

class SlideCell: UICollectionViewCell{

    lazy var coverView: UIView = UIView()
    lazy var imageView: UIImageView = UIImageView()
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(coverView)
        
        coverView.snp.makeConstraints { (make) in
            make.width.equalTo(220)
            make.height.equalTo(190)
            make.center.equalTo(contentView)
        }
        coverView.addSubview(imageView)
        
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.3
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.contentMode = .scaleToFill
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(coverView.snp.width)
            make.height.equalTo(coverView.snp.height)
            make.center.equalTo(coverView)
        }
    }
    
    
}
