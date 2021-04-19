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

    private var timer: Timer?
    private var arrCount: Int = 0
    
    private var serviceData = ServiceCollection()
    private var healthData = HealthCollection()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setColorWithView()
        tabBarController?.navigationItem.leftBarButtonItem = homeView.setNavigationBarTitle()
        tabBarController?.navigationItem.rightBarButtonItem = homeView.setNavigationBarAlarm()
        
    }
    
    override func bindViewModel(){
        super.bindViewModel()
        
        output.preparingViews?.filter{$0 == true}.drive{ [weak self] _ in
            guard let self = self else { return }
            self.view = self.homeView
            
            
        }.disposed(by: disposeBag)
        
        output.noticeArray?.filter{$0.count >= 3}.drive{ [weak self] array in
            guard let self = self else { return }
            self.homeView.noticeLabel.text = array[0]
            
            self.timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(2), repeats: true){_ in
                self.homeView.noticeLabel.alpha = 0
                UIView.animate(withDuration: 0.3) {
                    self.arrCount += 1
                    self.homeView.noticeLabel.text = array[self.arrCount % 3]
                    self.homeView.noticeLabel.animate(duration: 0.3)
                    self.homeView.noticeLabel.alpha = 1
                }
            }
        }.disposed(by: disposeBag)
    
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
        
        
    }


}

