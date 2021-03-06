//
//  HomeView.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/14.
//

import Foundation
import UIKit
import SnapKit

class HomeView: BaseView{
    
    lazy var scrollView = UIScrollView()
    
    lazy var pickerView = UIPickerView()
    lazy var startBtn = UIButton()
    
    lazy var mediPassLabel = UILabel()
    lazy var alarmLabel = UILabel()
    
    lazy var greetLabel = UILabel()
    lazy var greetLabel2 = UILabel()
    
    lazy var noticeView = UIView()
    lazy var noticeLabel = UILabel()
    
    var serviceCollectionView: UICollectionView!
    lazy var healthView = UIView()
    lazy var healthLabel = UILabel()
    var healthCollectionView: UICollectionView!
    
    lazy var slideView = UIView()
    var slideCollection: UICollectionView!
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = .systemBlue
        
        return pc
    }()
    
    override func setup() {
        super.setup()
        backgroundColor = .systemGray6
        serviceCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        let healthLayout = UICollectionViewFlowLayout()
        healthLayout.scrollDirection = .horizontal
        healthLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 10)
        healthCollectionView = UICollectionView(frame: .zero, collectionViewLayout: healthLayout)
        
        let slideLayout = UICollectionViewFlowLayout()
        slideLayout.scrollDirection = .horizontal
        slideLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        slideCollection = UICollectionView(frame: .zero, collectionViewLayout: slideLayout)
        
        scrollView.setDefalutView()
        
        addSubViews(scrollView)
        scrollView.backgroundColor = .systemGray6
        scrollView.snp.makeConstraints { (make) in
            make.width.height.equalTo(self)
            make.center.equalTo(self)
        }
        
        scrollView.addSubViews(greetLabel, greetLabel2, noticeView, serviceCollectionView, healthView, slideView, pageControl)
        
        greetLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(scrollView).offset(20)
            make.top.equalTo(scrollView).offset(20)
            make.width.equalTo(180)
            make.height.equalTo(30)
        }
        
        greetLabel.text = "병원 가는 길,"
        greetLabel.textAlignment = .left
        greetLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        greetLabel2.snp.makeConstraints { (make) in
            make.leading.equalTo(scrollView).offset(20)
            make.top.equalTo(greetLabel.snp.bottom)
            make.width.height.equalTo(greetLabel)
        }
     
        greetLabel2.text = "마스크 잊지마세요."
        greetLabel2.textAlignment = .left
        greetLabel2.font = UIFont.boldSystemFont(ofSize: 22)
        
        noticeView.backgroundColor = .white
        noticeView.setShadow()
        noticeView.snp.makeConstraints { (make) in
            make.width.equalTo(scrollView.snp.width).offset(-20)
            make.centerX.equalTo(scrollView)
            make.height.equalTo(40)
            make.top.equalTo(greetLabel2.snp.bottom).offset(25)
        }
        noticeView.layer.cornerRadius = 13
        noticeView.addSubview(noticeLabel)
        
        noticeLabel.snp.makeConstraints { (make) in
            make.width.equalTo(noticeView)
            make.height.equalTo(15)
            make.centerY.equalTo(noticeView.snp.centerY)
        }
        
        noticeLabel.textAlignment = .center
        noticeLabel.font = noticeLabel.font.withSize(14)
        noticeLabel.minimumScaleFactor = 0.1
        noticeLabel.adjustsFontSizeToFitWidth = true
        
        serviceCollectionView.backgroundColor = .white
        serviceCollectionView.layer.borderWidth = 0.5
        serviceCollectionView.setShadow()
        
        serviceCollectionView.snp.remakeConstraints { (make) in
            make.width.equalTo(noticeView.snp.width)
            make.height.equalTo(200)
            make.top.equalTo(noticeView.snp.bottom).offset(15)
            make.centerX.equalTo(scrollView)
        }
        
        healthView.backgroundColor = .white
        healthView.snp.makeConstraints { (make) in
            make.width.equalTo(serviceCollectionView.snp.width)
            make.height.equalTo(270)
            make.centerX.equalTo(scrollView)
            make.top.equalTo(serviceCollectionView.snp.bottom).offset(15)
            
        }
        
        healthView.addSubViews(healthLabel, healthCollectionView)
        healthView.backgroundColor = .white
        healthView.setShadow()
        
        healthLabel.text = "똑똑한 건강정보 알아보기"
        healthLabel.minimumScaleFactor = 0.1
        healthLabel.adjustsFontSizeToFitWidth = true
        
        healthLabel.snp.makeConstraints { (make) in
            make.top.equalTo(healthView.snp.top).offset(5)
            make.leading.equalTo(healthView.snp.leading).offset(12)
            make.width.equalTo(150)
            make.height.equalTo(35)
        }
        
        healthCollectionView.backgroundColor = .white
        healthCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(healthLabel.snp.bottom).offset(10)
            make.width.equalTo(healthView.snp.width)
            make.height.equalTo(210)
        }
        healthCollectionView.bounces = false
        healthCollectionView.showsHorizontalScrollIndicator = false
        
        slideCollection.backgroundColor = .black
        slideCollection.layer.cornerRadius = 13
        slideView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.width.equalTo(serviceCollectionView.snp.width)
            make.top.equalTo(healthView.snp.bottom).offset(20)
            make.centerX.equalTo(healthView)
        }
        slideView.backgroundColor = .yellow
        slideView.setShadow()
        slideView.addSubview(slideCollection)
        slideCollection.snp.makeConstraints { (make) in
            make.height.equalTo(slideView)
            make.width.equalTo(slideView)
            make.top.equalTo(healthView.snp.bottom).offset(20)
            make.centerX.equalTo(healthView)
        }
        slideCollection.bounces = false
        slideCollection.isPagingEnabled = true
        slideCollection.showsHorizontalScrollIndicator = false
        
        pageControl.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.top.equalTo(slideCollection.snp.bottom).inset(50)
            make.centerX.equalTo(scrollView)
            
        }
        
        pageControl.allowsContinuousInteraction = true
        
        
        scrollView.contentSize.height = 900

    }
    
    
    
    public func setNavigationBarTitle() -> UIBarButtonItem{
        
        let iconView = UIView()
        iconView.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
        
        iconView.addSubViews(mediPassLabel)
        
        mediPassLabel.text = "MediPass"
        mediPassLabel.font = UIFont.boldSystemFont(ofSize: 24)
        mediPassLabel.textColor = .purple
        mediPassLabel.textAlignment = .center
        mediPassLabel.snp.makeConstraints { (make) in
            make.width.equalTo(iconView)
            make.height.equalTo(iconView)
            make.center.equalTo(iconView)
        }

        return UIBarButtonItem(customView: iconView)
    }
    
    public func setNavigationBarAlarm() -> UIBarButtonItem{
        alarmLabel.text = "설정"
        alarmLabel.font = UIFont.boldSystemFont(ofSize: 18)
        alarmLabel.textColor = .gray
        alarmLabel.textAlignment = .right
        alarmLabel.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(25)
            
        }
        return UIBarButtonItem(customView: alarmLabel)
    }
    
    
}

