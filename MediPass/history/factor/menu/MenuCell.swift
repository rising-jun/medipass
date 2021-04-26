//
//  MenuCell.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/22.
//


import Foundation
import UIKit
import SnapKit

class MenuCell: UICollectionViewCell {
    static let reuseIdentifier = "TabBarCell"
    lazy var menuLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubViews(menuLabel)
        menuLabel.textColor = .lightGray
        menuLabel.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }
    }
    
    func setTitle(title: String) {
        menuLabel.text = title
    }
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                menuLabel.textColor = .black
            } else {
                menuLabel.textColor = .lightGray
            }
        }
    }
    
    override func prepareForReuse() {
        isSelected = false
        
    }
    
}

