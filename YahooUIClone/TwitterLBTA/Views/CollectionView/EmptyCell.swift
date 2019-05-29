//
//  EmptyCell.swift
//  TwitterLBTA
//
//  Created by user on 5/24/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit

class EmptyCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        //1 let touches through and only catch the ones on buttons
        let hitView = super.hitTest(point, with: event)
        
        if hitView is UIButton {
            return hitView
        }
        
        return nil
        
    }
}
