//
//  LogoFooterView.swift
//  TwitterLBTA
//
//  Created by user on 5/23/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit

class LogoFooterView: UITableViewHeaderFooterView {

    let logoImageView = UIImageView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    let image = UIImage(named: "YahooLogo")
    logoImageView.image = image
   
    addSubview(logoImageView)
    }
    
    
    override func willMove(toSuperview newSuperview: UIView?) {
        
    }
    
    override func layoutSubviews() {
         logoImageView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
}
