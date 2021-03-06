//
//  ViewController.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/14.
//

import UIKit
import RxSwift
import RxViewController

class HomeVC: BaseViewController {
    
    lazy var homeView = HomeView(frame: view.frame)
    
    private let disposeBag = DisposeBag()
    
    private var viewModel = HomeViewModel()
    private lazy var input = HomeViewModel
        .Input(viewState: self.rx.viewWillAppear
                .asSignal()
                .map{ _ in ViewLifeState.viewWillAppear}
                .asObservable())
    
    private lazy var output = viewModel.transform(input: input)
    
    private var timer = PublishSubject<Int>.timer(0, period: 2.0, scheduler: MainScheduler.instance)
    private var arrCount: Int = 0
    
    private var serviceData = ServiceCollection()
    private var healthData = HealthCollection()
    private var slideData = SlideCollection()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func bindViewModel(){
        super.bindViewModel()
        
        output.preparingViews?.filter{$0 == true}.drive{ [weak self] _ in
            guard let self = self else { return }
            self.view = self.homeView
            self.navigationController?.additionalSafeAreaInsets.top = 0
            self.navigationController?.navigationBar.standardAppearance.backgroundColor = UIColor.systemGray6
            self.navigationController?.navigationBar.setColorWithView()
            self.tabBarController!.navigationItem.leftBarButtonItem = self.homeView.setNavigationBarTitle()
            self.tabBarController!.navigationItem.rightBarButtonItem = self.homeView.setNavigationBarAlarm()
            
            self.homeView.scrollView.delegate = self
        }.disposed(by: disposeBag)
        
        output.noticeArray?.filter{$0.count >= 3}.drive{ [weak self] array in
            guard let self = self else { return }
            self.homeView.noticeLabel.text = array[0]
            
            self.timer.subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.homeView.noticeLabel.alpha = 0
                UIView.animate(withDuration: 0.4, animations: {
                    self.homeView.noticeLabel.text = ""
                    self.arrCount += 1
                    
                    self.homeView.noticeLabel.animate(duration: 0.4)
                }, completion: { (bool) in
                    if bool{
                        self.homeView.noticeLabel.text = array[self.arrCount % 3]
                        self.homeView.noticeLabel.alpha = 1
                    }else{
                        self.homeView.noticeLabel.alpha = 0
                    }
                })
                self.view.layoutIfNeeded()
            }
            
        )}.disposed(by: disposeBag)
        
        output.iconArray?.filter{$0.count >= 3}.drive{ [weak self] array in
            guard let self = self else { return }
            self.serviceData.cellArr = array
            self.homeView.serviceCollectionView.register(ServiceCell.self, forCellWithReuseIdentifier: "Service")
            self.homeView.serviceCollectionView.dataSource = self.serviceData
            self.homeView.serviceCollectionView.delegate = self.serviceData
            self.homeView.serviceCollectionView.reloadData()
        }.disposed(by: disposeBag)
        
        output.healthArray?.filter{$0.count >= 3}.drive{ [weak self] array in
            guard let self = self else { return }
            self.healthData.cellArr = array
            self.homeView.healthCollectionView.register(HealthCell.self, forCellWithReuseIdentifier: "health")
            self.homeView.healthCollectionView.delegate = self.healthData
            self.homeView.healthCollectionView.dataSource = self.healthData
        }.disposed(by: disposeBag)
        
        output.slideArray?.filter{$0.count >= 2}.drive{ [weak self] array in
            guard let self = self else { return }
            var cellArr: [SlideCellInfo] = []
            for e in array{
                let image = UIImage(data: e)!
                cellArr.append(SlideCellInfo(image))
            }
            
            self.slideData.cellArr = cellArr
            self.slideData.pageControl_ = self.homeView.pageControl
            self.slideData.timerStart()
            self.slideData.slider_ = self.homeView.slideCollection
            self.homeView.slideCollection.register(SlideCell.self, forCellWithReuseIdentifier: "Slide")
            self.homeView.slideCollection.delegate = self.slideData
            self.homeView.slideCollection.dataSource = self.slideData
            
            self.homeView.slideCollection.selectItem(at: IndexPath(row: 5001, section: 0), animated: false, scrollPosition: .left)
           
        }.disposed(by: disposeBag)
        
    
        
    }
    
}

extension HomeVC: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            self.navigationController?.navigationBar.standardAppearance.shadowColor = UIColor.gray
        }else{
            self.navigationController?.navigationBar.standardAppearance.shadowColor = nil
        }
        self.navigationController?.navigationBar.standardAppearance.backgroundColor = UIColor.systemGray6
    }
    
}
