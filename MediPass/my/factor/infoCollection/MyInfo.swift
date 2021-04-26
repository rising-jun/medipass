//
//  MyInfo.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/23.
//

import Foundation
import UIKit

struct MyInfo{
    
    public var qrImage_: UIImage{
        get{
            return qrImage
        }set(val){
            qrImage = val
        }
    }
    private var qrImage = UIImage()
    
    
    public var qrVal_: String{
        get{
            return qrVal
        }set(val){
            qrVal = val
        }
    }
    
    private var qrVal = ""
    
    public var point_: String{
        get{
            return point
        }set(val){
            point = val
        }
    }
    private var point = ""
    
    public var iconArray_: [UIImage]{
        get{
            return iconArray
        }set(val){
            iconArray = val
        }
    }
    private var iconArray = [UIImage()]
    
    public var introArray_: [String]{
        get{
            return introArray
        }set(val){
            introArray = val
        }
    }
    private var introArray = [""]
    
}
