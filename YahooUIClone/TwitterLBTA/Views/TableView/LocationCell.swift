//
//  TableViewCell.swift
//  TwitterLBTA
//
//  Created by user on 5/21/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {
    
  
    let locationLabel = UILabel()
    let separatorView = UIView()
    
    var location: Location? {
        didSet {
            if let location = location {
              self.locationLabel.text = location.name
            }
        }
    }

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = UIColor.red
    
        locationLabel.text = location?.name
        locationLabel.backgroundColor = UIColor.black
        locationLabel.textColor = UIColor.white
        
      
        locationLabel.text = location?.name
        
     
        separatorView.backgroundColor = UIColor.yellow
        
        addSubview(locationLabel)
        addSubview(separatorView)
      
        }
    
    override func layoutSubviews() {
          locationLabel.frame = CGRect(x: 0, y: 0, width: bounds.width, height: contentView.bounds.height)
        
        separatorView.frame = CGRect(x: 0, y: bounds.height - 6, width: bounds.width, height: 6)
    }
    
    
    
    override func prepareForReuse() {
       locationLabel.text = nil
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
