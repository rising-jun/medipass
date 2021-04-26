//
//  HistoryViewModel.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/22.
//

import Foundation
import RxSwift
import RxCocoa

class HistoryViewModel: ViewModelType{
    
    private let disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let preparingViews = BehaviorRelay(value: false)
        
        input.viewState?.filter{$0 == .viewWillAppear}.take(1).subscribe(onNext: {[weak self] (state) in
            guard let self = self else {return}
            
        }).disposed(by: disposeBag)
        
        input.viewState?.filter{$0 == .viewWillAppear}.subscribe(onNext: { (state) in
            preparingViews.accept(true)
        }).disposed(by: disposeBag)
        
        return Output(preparingViews: preparingViews.asDriver())
    }
    
    struct Input{
        var viewState: Observable<ViewLifeState>?
    }
    
    
    struct Output{
        var preparingViews: Driver<Bool>?
    }
    
}
