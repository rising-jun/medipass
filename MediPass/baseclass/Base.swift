//
//  Base.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/14.
//

import Foundation
import UIKit

class BaseView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .black
    }
}

class BaseViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindViewModel()
    }
    
    public func setup() {
        
    }
    
    public func bindViewModel() {
        
    }
}

protocol ViewModelType: class {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}

extension UIView {
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    final func animate(duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
        CAMediaTimingFunctionName.default)
        animation.subtype = CATransitionSubtype.fromBottom
        animation.type = CATransitionType.moveIn
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.reveal.rawValue)
    }
    
    final func setShadow(){
        layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 2)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
        layer.cornerRadius = 15
        clipsToBounds = false
        layer.masksToBounds = false
    }

}

extension UINavigationBar{
    final func setColorWithView(){
        barTintColor = .systemGray6
        shadowImage = UIImage()
        isTranslucent = false
    }
}

extension UIScrollView{
    final func setDefalutView(){
        contentSize.width = frame.width
        contentSize.height = frame.height * 2
        isScrollEnabled = true
        alwaysBounceVertical = true
        
    }
}
