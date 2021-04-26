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
        
        coverView.layer.masksToBounds = true
        coverView.translatesAutoresizingMaskIntoConstraints = true
        coverView.snp.makeConstraints { (make) in
            make.width.equalTo(contentView)
            make.height.equalTo(contentView)
            make.center.equalTo(contentView)
        }
        coverView.addSubview(imageView)
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(coverView.snp.width)
            make.height.equalTo(coverView.snp.height)
            make.center.equalTo(coverView)
        }
    }
    
    
}
