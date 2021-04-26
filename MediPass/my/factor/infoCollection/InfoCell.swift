//
//  InfoCell.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/23.
//

import Foundation
import UIKit
import SnapKit

class InfoCell: UICollectionViewCell{

    lazy var idView = UIView()
    lazy var nameLabel = UILabel()
    
    lazy var qrView = UIImageView()
    lazy var myNumLabel = UILabel()
    
    lazy var didValView = UIView()
    lazy var didValLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubViews(nameLabel,idView)
        
        nameLabel.text = "메블지망생"
        nameLabel.minimumScaleFactor = 0.1
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.top.equalTo(contentView.snp.top).offset(30)
            make.leading.equalTo(contentView.snp.leading).offset(20)
        }
        
        idView.backgroundColor = .purple
        idView.layer.cornerRadius = 12
        idView.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(contentView.snp.leading).offset(15)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
            make.height.equalTo(500)
        }
        
        
        
        idView.addSubViews(qrView, myNumLabel, didValView)
        
        
        
        qrView.translatesAutoresizingMaskIntoConstraints = true
        qrView.layer.masksToBounds = true
        qrView.layer.cornerRadius = 13
        qrView.backgroundColor = .white
        qrView.snp.makeConstraints { (make) in
            make.top.equalTo(idView.snp.top).offset(20)
            make.leading.equalTo(idView.snp.leading).offset(20)
            make.trailing.equalTo(idView.snp.trailing).offset(-20)
            make.height.equalTo(350)
            
        }
        
        myNumLabel.text = "나의 DID 고유번호"
        myNumLabel.adjustsFontSizeToFitWidth = true
        myNumLabel.textColor = .white
        myNumLabel.textAlignment = .center
        
        let text: String = "나의 DID 고유번호"
        let attributedString = NSMutableAttributedString.init(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: text.count))
        myNumLabel.attributedText = attributedString
        
        myNumLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(qrView)
            make.width.equalTo(120)
            make.height.equalTo(30)
            make.top.equalTo(qrView.snp.bottom).offset(20)
        }
        
        didValView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        didValView.layer.cornerRadius = 15
        didValView.snp.makeConstraints { (make) in
            make.top.equalTo(myNumLabel.snp.bottom).offset(10)
            make.leading.equalTo(idView.snp.leading).offset(15)
            make.trailing.equalTo(idView.snp.trailing).offset(-10)
            make.height.equalTo(40)
        }
        
        didValView.addSubview(didValLabel)
        didValLabel.textColor = UIColor.white.withAlphaComponent(1)
        didValLabel.font = didValLabel.font.withSize(14)
        didValLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(didValView.snp.leading).offset(15)
            make.trailing.equalTo(didValView.snp.trailing).offset(-15)
            make.center.equalTo(didValView)
            make.height.equalTo(30)
        }
        
        
    }
    
    
    public func setUIDatas(_ myInfo: MyInfo){
        qrView.image = myInfo.qrImage_
        didValLabel.text = myInfo.qrVal_
    }

}
