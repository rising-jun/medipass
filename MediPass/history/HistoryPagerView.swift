//
//  HistoryView.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/22.
//

import Foundation
import UIKit
import SnapKit

class HistoryPagerView: BaseView{
    
    lazy var historyLabel = UILabel()
    lazy var menuTabBar = UICollectionView()
    var pager: UICollectionView!
    lazy var highlightView = UIView()
    
    override func setup() {
        super.setup()
        backgroundColor = .systemGray6
        
        let pagerLayout = UICollectionViewFlowLayout()
        pagerLayout.scrollDirection = .horizontal
        
        let menuLayout = UICollectionViewFlowLayout()
        menuLayout.scrollDirection = .horizontal
        pager = UICollectionView(frame: .zero, collectionViewLayout: pagerLayout)
        menuTabBar = UICollectionView(frame: .zero, collectionViewLayout: menuLayout)
        addSubViews(historyLabel, menuTabBar, pager, highlightView)
        
        historyLabel.text = "내역"
        historyLabel.minimumScaleFactor = 0.1
        historyLabel.font = UIFont.boldSystemFont(ofSize: 24)
        historyLabel.adjustsFontSizeToFitWidth = true
        historyLabel.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading).offset(20)
        }
        
        
        menuTabBar.bounces = false
        menuTabBar.showsHorizontalScrollIndicator = false
        menuTabBar.backgroundColor = .systemGray6
        menuTabBar.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(50)
            make.top.equalTo(historyLabel.snp.bottom)
            
        }
        
        highlightView.backgroundColor = .black
        highlightView.snp.makeConstraints { (make) in
            make.height.equalTo(3)
            make.top.equalTo(menuTabBar.snp.bottom).offset(0)
        }
        
        pager.bounces = false
        pager.isPagingEnabled = true
        pager.showsHorizontalScrollIndicator = false
        
        pager.snp.makeConstraints { (make) in
            make.top.equalTo(highlightView.snp.bottom).offset(0)
            make.width.equalTo(self)
            make.height.equalTo(600)
        }
        
    }
}
