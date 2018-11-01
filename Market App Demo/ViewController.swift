//
//  ViewController.swift
//  Market App Demo
//
//  Created by Vijay લાDવા on 01/11/18.
//  Copyright © 2018 Vijay લાDવા. All rights reserved.
//

import UIKit
import BetterSegmentedControl

class ViewController: UIViewController {

    @IBOutlet weak var viewHeaderHeight :NSLayoutConstraint!
    @IBOutlet weak var collectionViewList :UICollectionView!
    @IBOutlet weak var btnCompareMoneyTransfer :UIButton!
    @IBOutlet weak var segmentControlView :UIView!
    @IBOutlet weak var betterSegemntScrollWidth :NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.InitialSetup()
    }
    
    private func InitialSetup(){
        
        
        let control = BetterSegmentedControl(
            frame: CGRect(x: 10, y: 3, width: 500, height: 44),
            segments: LabelSegment.segments(withTitles: ["Money Transfer", "Insurance", "Credit","Loans"],
                                            normalFont: UIFont.boldSystemFont(ofSize: 14),
                                            normalTextColor: .lightGray,
                                            selectedFont: UIFont.boldSystemFont(ofSize: 14),
                                            selectedTextColor: .white),
            index: 0,
            options: [.backgroundColor(.clear),
                      .indicatorViewBackgroundColor(UIColor(red: 29/255.0, green: 29/255.0, blue: 40/255.0, alpha: 1.0)),
                      .cornerRadius(22.0)])
        segmentControlView.addSubview(control)
        betterSegemntScrollWidth.constant = 500
        self.collectionViewList.delegate = self
        self.collectionViewList.dataSource = self
        self.collectionViewList.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCollectionViewCell")
        self.btnCompareMoneyTransfer.layer.cornerRadius = (self.btnCompareMoneyTransfer.frame.size.height / 2)
    }


}
extension ViewController : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > (self.collectionViewList.frame.size.width * 2){
            self.viewHeaderHeight.constant = 0
            self.tabBarController?.tabBar.isHidden = true
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
            
        }
        else{
            
            self.viewHeaderHeight.constant = 80
            self.tabBarController?.tabBar.isHidden = false
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath)
        
        return itemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)
    }
}
