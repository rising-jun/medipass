//
//  SlideCollection.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SlideCollection: NSObject{
    public var cellArr: [SlideCellInfo] = []
    private var pageControl: UIPageControl!
    public var pageControl_: UIPageControl{
        get{
            return pageControl
        }set(val){
            pageControl = val
        }
    }
    private var timer : BehaviorRelay = BehaviorRelay(value: true)
    private var disposeBag = DisposeBag()
    private var index: Int = 0
    
    private var slider: UICollectionView!
    public var slider_: UICollectionView{
        get{
            return slider
        }set(val){
            slider = val
        }
    }
    
    public func timerStart(){
        //print(imageArr.count)
        timer.asObservable()
            .flatMapLatest { isRunning in
                isRunning ? Observable<Int>
                    .interval(.seconds(3), scheduler: MainScheduler.instance) : .empty()
            }
            .subscribe(onNext: { [weak self] value in
                //get cell size
                
            self?.moveToNextPage(collectionView: self!.slider,timer: true)
            }).disposed(by: disposeBag)
    }
    
    private func moveToNextPage(collectionView: UICollectionView,timer : Bool){
        
        let cellSize = CGSize(width: collectionView.frame.width, height: 260);
                //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset
                //scroll to next cell
        if timer {
        collectionView.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)
        }
        let pageFloat = ( collectionView.contentOffset.x /  collectionView.frame.size.width)
        let pageInt = Int(round(pageFloat))
        
        pageControl.currentPage = (Int(collectionView.contentOffset.x) / Int(collectionView.frame.width) % cellArr.count )
        
        switch pageInt {
        case 0:
            if !timer{
                    //collectionView.scrollToItem(at: [0, self.imageArr.count], at: .left, animated: false)
                    collectionView.scrollToItem(at: IndexPath(row: 5001, section: 0), at: .left, animated: false)
                    //print("worked")
                
               
            }
        break
        case 1000:
            collectionView.scrollToItem(at: IndexPath(row: 5001, section: 0), at: .right, animated: timer)

        break
        default:
            break
        }
    }
    
}

extension SlideCollection: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = cellArr.count
        pageControl.isHidden = !(cellArr.count > 1)
        return 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Slide", for: indexPath) as! SlideCell
        
        cell.imageView.image = cellArr[indexPath.row % cellArr.count].image_
        cell.awakeFromNib()
        return cell
    }
    
    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // cell 사이즈( 옆 라인을 고려하여 설정 )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = CGSize(width: (collectionView.frame.width), height: (collectionView.frame.height))
        return size
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        timer.accept(true)
        self.moveToNextPage(collectionView: scrollView as! UICollectionView,timer: false)
        pageControl.layoutIfNeeded()
    }

    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer.accept(false)
    }
    
}
