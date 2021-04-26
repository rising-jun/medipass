//
//  ReservationVC.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/22.
//

import Foundation
import UIKit

class ReservationVC: BaseViewController {
    lazy var reservationView = ReservationView(frame: view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = reservationView
        
    }
    
}
