//
//  HomeModel.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/14.
//

import Foundation
import RxSwift

class HomeModel{
    
    public func getNoticeArray() -> [String]{
        return ["메디패스를 이용해주셔서","항상","감사합니다!"]
    }
    
    public func getIconArray() -> [ServiceCellInfo]{
        var arr: [ServiceCellInfo] = []
        arr.append(ServiceCellInfo("진로내역", UIImage(named: "icon1")!))
        arr.append(ServiceCellInfo("패스청구", UIImage(named: "icon2")!))
        arr.append(ServiceCellInfo("사진청구", UIImage(named: "icon3")!))
        arr.append(ServiceCellInfo("병원예약", UIImage(named: "icon1")!))
        arr.append(ServiceCellInfo("접종내역", UIImage(named: "icon2")!))
        
        return arr
    }
    
    public func getHealthArray() -> [HealthCellInfo]{
        var arr: [HealthCellInfo] = []
        arr.append(HealthCellInfo("병원마다 다른 비급여 진료비 확인 방법은?", UIImage(named: "is1")!))
        arr.append(HealthCellInfo("어린이보험 가입 가능한 나이 만 30세?!", UIImage(named: "is4")!))
        arr.append(HealthCellInfo("본인부담상한제 실손보험 보상 못받는 이유", UIImage(named: "is5")!))
        arr.append(HealthCellInfo("알아두면 좋은 꿀팁 2탄! 상항별 실손청구 서류", UIImage(named: "is1")!))
        arr.append(HealthCellInfo("바뀐 보험료 연말정산 이거 하나만 알면 끝!", UIImage(named: "is4")!))
        
        return arr
    }
    
    public func getSlideArray() -> [SlideCellInfo]{
        var arr: [SlideCellInfo] = []
        arr.append(SlideCellInfo(UIImage(named: "is1")!))
        arr.append(SlideCellInfo(UIImage(named: "is4")!))
        
        return arr
    }
    
    
    
    public func getImageData() -> PublishSubject<[Data]>{
        let imageURL: [String] = ["https://i0.wp.com/blog.medibloc.org/wp-content/uploads/2021/03/메디패스-국문-1.png?fit=1024%2C595&ssl=1",
             "https://i1.wp.com/blog.medibloc.org/wp-content/uploads/2021/04/메디블록-국문.png?w=1024&ssl=1"]
        var imageData = PublishSubject<[Data]>()
        var tempData: [Data] = []
        for url in imageURL{
            let encoded = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            let myURL = URL(string: encoded)

            let request = URLRequest(url: myURL!)
        URLSession.shared.rx
            .data(request: request)
            .observeOn(ConcurrentDispatchQueueScheduler.init(qos: .userInteractive))
            .bind { (data) in
                tempData.append(data)
                if tempData.count == 2 {
                    imageData.onNext(tempData)
                }
            }
        }
        
        
        return imageData
    }
}
