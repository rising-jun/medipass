//
//  SlideInfo.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/20.
//

import Foundation
import UIKit

struct SlideCellInfo{
    init(_ image: UIImage) {
        self.image = image
    }
    
    public var image_: UIImage{
        get{
            return image
        }set(val){
            image = val
        }
    }
    private var image = UIImage()
    
    public var imageData_: [Data]{
        get{
            return imageData
        }
        set(val){
            imageData = val
        }
    }
    private var imageData: [Data] = []
}
