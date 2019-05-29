//
//  RefreshView.swift
//  TwitterLBTA
//
//  Created by user on 5/20/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit

class RefreshView: UIView {
    
    let ovalShapeLayer: CAShapeLayer = CAShapeLayer()
    
    let cityLabel =  UILabel()
    
    var location: Location! {
        didSet{
            configureForLocation(location: location)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
      
        backgroundColor = UIColor.darkGray
        alpha = 0.65
        
        cityLabel.textColor = UIColor.white
        cityLabel.backgroundColor = UIColor.darkGray
        cityLabel.textAlignment = .center
        let frame = CGRect(x: 16, y: self.bounds.maxY - 43 - 8, width: 280, height: 40)
        cityLabel.frame = frame
        addSubview(cityLabel)
    
         let y = self.bounds.maxY - 3
        let seperatorRect = CGRect(x: 0, y: y, width: bounds.width, height: 1)
        let separatorView = UIView(frame: seperatorRect)
        separatorView.backgroundColor = UIColor.yellow
       
        addSubview(separatorView)
        
    }
    
    override func didMoveToSuperview() {
        
        if location != nil  {
        
        configureForLocation(location: location)
        }
    }
    
    
    func configureForLocation(location: Location) {
        
        if location != nil {
            let rawDate = location.date
            
            let displayString = rawDate.timeAgoDisplay()
            cityLabel.text = "\(location.name)  last updated" + " " + displayString
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateRefresh() {
    UIView.animate(withDuration: 0.3, delay:0.0, options: .curveEaseOut,
    animations: {
    
    
        let newY = self.frame.minY + 100
        self.frame = CGRect(x: 0, y: newY, width: self.bounds.width, height: self.bounds.height)
    },
    completion: {_ in
    //finished
    }
    )
}
}
