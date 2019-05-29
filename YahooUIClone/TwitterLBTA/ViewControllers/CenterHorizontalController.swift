//
//  HomeController.swift
//  TwitterLBTA
//
//  Created by Brian Voong on 12/14/16.
//  Copyright © 2016 Lets Build That App. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
class CenterHorizontalController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pagingCell = "PageCell"
    
    var locations: [Location]!
    
    var pageCell: PageCell! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      collectionView?.backgroundColor = UIColor.white
    
     setupPagingCollectionView()
    }
    
    override var prefersStatusBarHidden: Bool {
      return true 
    }
    
    // sideways paging horizontal collectionView
    func setupPagingCollectionView() {
        
    if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
    flowLayout.scrollDirection = .horizontal
    flowLayout.minimumLineSpacing = 0
    flowLayout.minimumInteritemSpacing = 0
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            
    }
   
    collectionView?.bounces = false
        
    collectionView?.register(PageCell.self, forCellWithReuseIdentifier: pagingCell)
        
    collectionView?.isPagingEnabled = true
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: pagingCell, for: indexPath) as! PageCell
        
      let currentLocation = locations[indexPath.item]
      pageCell.location = currentLocation
        
      return pageCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height)
    }
  }
