//
//  MyView.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/22.
//

import Foundation
import SnapKit

class MyView: BaseView{
    
    lazy var scrollView = UIScrollView()
    
    
    var infoCollectionView: UICollectionView!
    
    var noticeCollectionView: UICollectionView!
    
    override func setup() {
        super.setup()
        backgroundColor = .systemGray6
        
        infoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        noticeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        addSubview(scrollView)
        scrollView.contentSize.height = 1000
        scrollView.backgroundColor = .systemGray4
        scrollView.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(self.safeAreaLayoutGuide)
            make.center.equalTo(self.safeAreaLayoutGuide)
            
        }
        
        scrollView.addSubViews(infoCollectionView, noticeCollectionView)
        
        
        infoCollectionView.backgroundColor = .systemGray6
        infoCollectionView.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.top.equalTo(scrollView.snp.top)
            make.height.equalTo(700)
        }
        
        noticeCollectionView.backgroundColor = .systemGray6
        noticeCollectionView.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.top.equalTo(infoCollectionView.snp.bottom).offset(10)
            make.height.equalTo(300)
        }
        
    }
}
