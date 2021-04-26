//
//  ReservationView.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/22.
//

import Foundation
import SnapKit

class ReservationView: BaseView{
    
    lazy var label = UILabel()
    
    override func setup() {
        super.setup()
        backgroundColor = .systemGray6
        addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.center.equalTo(self)
        }
        
        label.text = "내역이 없습니다."
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        
    }
}
