//
//  HistoryVC.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/22.
//

import Foundation
import RxSwift
import RxViewController

class HistoryPagerVC: BaseViewController {
    
    lazy var pagerView = HistoryPagerView(frame: view.frame)
    
    private let disposeBag = DisposeBag()
    
    lazy var vcArray: [UIViewController] = [self.VCInstance(name: .claim),self.VCInstance(name: .reservation)]
    private var direction: Int = 0
    
    private let menuData = MenuCollection()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let firstIndexPath = IndexPath(item: 0, section: 0) // delegate 호출
        pagerView.menuTabBar.selectItem(at: firstIndexPath, animated: false, scrollPosition: .right)
        menuData.collectionView(pagerView.menuTabBar, didSelectItemAt: firstIndexPath)
    }
    
    private func VCInstance(name: VcId) -> UIViewController {
        switch name {
        case .claim:
            let claimVC = ClaimVC()
            return claimVC
        default:
            let reservationVC = ReservationVC()
            return reservationVC
            
        }
    }
    
    
    private var viewModel = HistoryViewModel()
    private lazy var input = HistoryViewModel
        .Input(viewState: self.rx.viewWillAppear
                .asSignal()
                .map{ _ in ViewLifeState.viewWillAppear}
                .asObservable())
    
    private lazy var output = viewModel.transform(input: input)
    
    override func bindViewModel() {
        super.bindViewModel()
        
        output.preparingViews?.filter{$0 == true}.drive{ [weak self] _ in
            guard let self = self else { return }
            self.view = self.pagerView
            self.navigationController?.additionalSafeAreaInsets.top = 0
            self.navigationController?.navigationBar.standardAppearance.shadowColor = nil
            self.navigationController?.navigationBar.setColorWithView()
            self.tabBarController?.navigationItem.leftBarButtonItem = nil
            self.tabBarController?.navigationItem.rightBarButtonItem = nil
            
            let pagerView = self.pagerView
            let menuData = self.menuData
            
            menuData.pager = pagerView.pager
            menuData.highlightView = pagerView.highlightView
            menuData.view = self.view
            pagerView.menuTabBar.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
            pagerView.menuTabBar.dataSource = menuData
            pagerView.menuTabBar.delegate = menuData
            
            pagerView.pager.register(PagerCell.self, forCellWithReuseIdentifier: "pagerCell")
            pagerView.pager.delegate = self
            pagerView.pager.dataSource = self
        }.disposed(by: disposeBag)
        
    }
    
}
extension HistoryPagerVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let frameVC = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pagerCell", for: indexPath) as! PagerCell
        var vc = vcArray[indexPath.row]
        vc.view.frame = frameVC
        cell.view = vc.view
        cell.awakeFromNib()
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(collectionView.frame.width), height: CGFloat(collectionView.frame.height))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let velocity = scrollView.panGestureRecognizer.velocity(in: scrollView)
        if velocity.x < 0 { // -: 오른쪽에서 왼쪽 <<<
            direction = -1
            
        } else if velocity.x > 0 { // +: 왼쪽에서 오른쪽 >>>
            direction = 1
            
        } else { }
        UIView.animate(withDuration: 0.1) { [weak self] in
            self!.pagerView.highlightView.transform = CGAffineTransform(translationX: scrollView.contentOffset.x / 2, y: 0)
            self!.pagerView.highlightView.layoutIfNeeded()
        }
        
        
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = Int(targetContentOffset.pointee.x / pagerView.menuTabBar.frame.width)
        let indexPath = IndexPath(item: index, section: 0)
        
        if direction > 0 { // >>>> 스와이프하면 스크롤은 중앙으로
            pagerView.menuTabBar.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        } else { // <<<< 스와이프하면 스크롤은 왼쪽으로
            pagerView.menuTabBar.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        }
        
        pagerView.menuTabBar.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
        //viewIndex.onNext(indexPath.row)

    }
}

enum VcId{
    case claim
    case reservation
}
