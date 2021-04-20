//
//  HomeViewModel.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/14.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel: ViewModelType{
    
    private let disposeBag = DisposeBag()
    
    private let model = HomeModel()
    
    func transform(input: Input) -> Output {
        let preparingViews = BehaviorRelay(value: false)
        let noticeString = BehaviorRelay(value: [""])
        let iconArray = BehaviorRelay(value: [ServiceCellInfo]())
        let healthArray = BehaviorRelay(value: [HealthCellInfo]())
        let slideArray = BehaviorRelay(value: [Data]())
        
        input.viewState?.filter{$0 == .viewWillAppear}.subscribe(onNext: {[weak self] (state) in
            guard let self = self else {return}
            preparingViews.accept(true)
            noticeString.accept(self.model.getNoticeArray())
            iconArray.accept(self.model.getIconArray())
            healthArray.accept(self.model.getHealthArray())
            
            let arrData = self.model.getImageData()
            arrData.bind { (arr) in
                slideArray.accept(arr)
            }.disposed(by: self.disposeBag)
            
        }).disposed(by: disposeBag)
        
        return Output(preparingViews: preparingViews.asDriver(),
                      noticeArray: noticeString.asDriver(),
                      iconArray: iconArray.asDriver(),
                      healthArray: healthArray.asDriver(),
                      slideArray: slideArray.asDriver())
    }
    
    struct Input{
        var viewState: Observable<ViewLifeState>?
    }
    
    
    struct Output{
        var preparingViews: Driver<Bool>?
        var noticeArray: Driver<[String]>?
        var iconArray: Driver<[ServiceCellInfo]>?
        var healthArray: Driver<[HealthCellInfo]>?
        var slideArray: Driver<[Data]>?
    }
    
}

enum ViewLifeState{
    case viewWillAppear
}

enum VC{
    case startVC
    case postVC
}
