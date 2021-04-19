//
//  HealthCellInfo.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/19.
//

import Foundation
import UIKit

struct HealthCellInfo{
    init(_ title: String, _ image: UIImage) {
        self.title = title
        self.image = image
    }
    
    public var title_: String{
        get{
            return title
        }set(val){
            title = val
        }
    }
    private var title: String = ""
    
    public var image_: UIImage{
        get{
            return image
        }set(val){
            image = val
        }
    }
    private var image = UIImage()
    
    public var imageData_: [String]{
        get{
            return imageData
        }
        set(val){
            imageData = val
        }
    }
    private var imageData: [String] = []
}
