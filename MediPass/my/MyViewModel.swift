//
//  MyViewModel.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/22.
//

import Foundation
import RxSwift
import RxCocoa

class MyViewModel: ViewModelType{
    
    private let disposeBag = DisposeBag()
    private let myModel = MyModel()
    func transform(input: Input) -> Output {
        let preparingViews = BehaviorRelay(value: false)
        let infoData = BehaviorRelay(value: MyInfo())
        let noticeData = BehaviorRelay(value: MyInfo())
        
        input.viewState?.filter{$0 == .viewWillAppear}.take(1).subscribe(onNext: {[weak self] (state) in
            guard let self = self else {return}
            
            infoData.accept(self.myModel.getInfoData())
            noticeData.accept(self.myModel.getNoticeData())
            
        }).disposed(by: disposeBag)
        
        input.viewState?.filter{$0 == .viewWillAppear}.subscribe(onNext: { (state) in
            preparingViews.accept(true)
        }).disposed(by: disposeBag)
        
        return Output(preparingViews: preparingViews.asDriver(),
                      infoData: infoData.asDriver(),
                      noticeData: noticeData.asDriver())
    }
    
    struct Input{
        var viewState: Observable<ViewLifeState>?
    }
    
    
    struct Output{
        var preparingViews: Driver<Bool>?
        var infoData: Driver<MyInfo>?
        var noticeData: Driver<MyInfo>?
    }
    
}
