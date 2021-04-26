//
//  MyVC.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/22.
//

import Foundation
import RxSwift
import RxViewController

class MyVC: BaseViewController {

    lazy var myView = MyView(frame: view.frame)
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private let infoCollection = InfoCollection()
    private let noticeCollection = NoticeCollection()
    private var viewModel = MyViewModel()
    private lazy var input = MyViewModel
        .Input(viewState: self.rx.viewWillAppear
                .asSignal()
                .map{ _ in ViewLifeState.viewWillAppear}
                .asObservable())
    
    private lazy var output = viewModel.transform(input: input)
    
    override func bindViewModel() {
        super.bindViewModel()
        
        
        output.preparingViews?.filter{$0 == true}.drive{ [weak self] _ in
            guard let self = self else { return }
            //self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.additionalSafeAreaInsets.top = -44
            self.tabBarController!.navigationItem.leftBarButtonItem = nil
            self.tabBarController!.navigationItem.rightBarButtonItem = nil
            self.view = self.myView
            self.myView.scrollView.delegate = self
        }.disposed(by: disposeBag)
     
        output.infoData?.filter{$0.point_ != ""}.drive{ [weak self] info in
            guard let self = self else { return }
            self.infoCollection.myInfo_ = info
            self.myView.infoCollectionView.delegate = self.infoCollection
            self.myView.infoCollectionView.dataSource = self.infoCollection
            self.myView.infoCollectionView.register(InfoCell.self, forCellWithReuseIdentifier: "info")
            self.myView.infoCollectionView.register(AboutMediCell.self, forCellWithReuseIdentifier: "aboutMedi")
        }.disposed(by: disposeBag)
        
        output.noticeData?.filter{$0.iconArray_.count != 0}.drive{ [weak self] info in
            guard let self = self else { return }
            self.noticeCollection.myInfo_ = info
            self.myView.noticeCollectionView.delegate = self.noticeCollection
            self.myView.noticeCollectionView.dataSource = self.noticeCollection
            self.myView.noticeCollectionView.register(AboutMediCell.self, forCellWithReuseIdentifier: "notice")
        }.disposed(by: disposeBag)
        
    }
    
}

extension MyVC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            self.navigationController?.navigationBar.standardAppearance.shadowColor = UIColor.gray
        }else{
            self.navigationController?.navigationBar.standardAppearance.shadowColor = nil
        }
        self.navigationController?.navigationBar.standardAppearance.backgroundColor = UIColor.systemGray6
    }
}
