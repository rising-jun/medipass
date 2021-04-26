//
//  ClaimVC.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/22.
//

import Foundation
import UIKit

class ClaimVC: BaseViewController {
    
    lazy var claimView = ClaimView(frame: view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = claimView
        
    }
    
}
