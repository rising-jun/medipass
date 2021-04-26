//
//  MyModel.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/23.
//

import Foundation
import RxSwift

class MyModel{
    
    public func getInfoData() -> MyInfo{
        var info = MyInfo()
        info.qrImage_ = UIImage(named: "is4")!
        info.qrVal_ = "fewncneioceoivrefiovrmeocmwrocmewmkocnmeklvr"
        info.point_ = "1,000p"
        info.iconArray_ = [UIImage(named: "icon1")!, UIImage(named: "icon2")!]
        info.introArray_ = ["메디블로그", "메디포인트"]
        return info
    }
    
    public func getNoticeData() -> MyInfo{
        var info = MyInfo()
        info.iconArray_ = [UIImage(named: "icon1")!, UIImage(named: "icon2")!, UIImage(named: "icon3")!]
        info.introArray_ = ["공지사항", "메디패스 공유하기", "고객센터 / 도움말"]
        return info
    }
    
}
