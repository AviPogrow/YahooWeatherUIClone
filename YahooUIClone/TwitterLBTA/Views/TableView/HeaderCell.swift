//
//  HeaderCell.swift
//  TwitterLBTA
//
//  Created by user on 5/21/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewHeaderFooterView {

    
    var signUpButton = UIButton(type: .roundedRect)
    let closeButton = UIButton(type: .roundedRect)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
     }
    
    func setupViews() {
        
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        signUpButton.backgroundColor = UIColor.darkGray
        signUpButton.setTitle("SignUp", for: .normal)
        
        signUpButton.tintColor = UIColor.white
        
        let signUpRect = CGRect(x: 0, y: 0, width: 110, height: 64)
        signUpButton.frame = signUpRect
        
        //signUpButton.layer.borderColor = UIColor.black.cgColor
        //signUpButton.layer.borderWidth = 4.0
        
        addSubview(signUpButton)
        
        
        
        closeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        closeButton.backgroundColor = UIColor.darkGray
        closeButton.setTitle("Close", for: .normal)
        closeButton.tintColor = UIColor.white
        
        let rect = CGRect(x: 16 + 110, y: 0, width: 64, height: 64)
        closeButton.frame = rect
        
        //closeButton.layer.borderColor = UIColor.black.cgColor
        //closeButton.layer.borderWidth = 4.0
        addSubview(closeButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        contentView.backgroundColor = UIColor.darkGray
    }
    
}
