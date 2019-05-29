//
//  InnerCollectionViewController.swift
//  TwitterLBTA
//
//  Created by user on 5/23/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit


/*
@available(iOS 11.0, *)
class InnerCollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "CurrentConditionsCell"
    
    var refreshView: RefreshView!
    var location: Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let height = view.bounds.height
        let width =  view.bounds.width
        let x = 0.0
        let y = CGFloat(view.bounds.minY)
        let rect = CGRect(x: CGFloat(x), y: y, width: width, height: height)
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        
        layout.sectionHeadersPinToVisibleBounds = true
        
      
        
        collectionView!.register(HeaderStatusCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
        
      }

 
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // 
    
        return cell
    }
    
    
    func addRefreshViewToCollectionView() {
        let refreshViewHeight: CGFloat = 84
        let refreshRect = CGRect(x: 0.0, y: -refreshViewHeight, width: view.frame.size.width, height: refreshViewHeight)
        
        
        refreshView = RefreshView(frame: refreshRect)
        
        refreshView.location = location
    
        collectionView!.addSubview(refreshView)
    }

    

}
*/
