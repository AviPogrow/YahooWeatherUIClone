//
//  BaseCell.swift
//  TwitterLBTA
//
//  Created by user on 5/20/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit

class CurrentConditionsCell: UICollectionViewCell {
   
    //let cars = "⤒⤓⟳◦○ ➕🌨🌩⛈🌥☁️🌦⛅️🌤☀️"
    //let strings = "🂨🃗🃕"
   
    let hiLowString = "  ⤒  75°  ⤓  65°"
    
    var location: Location? {
        didSet {
            //wordLabel.text = location?.name ?? "default"
            hiLowLabel.text = hiLowString
            currentTempLabel.text = "75°"
            currentConditLabel.text = "⛈  Raining"
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let currentConditLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.clear
        let font = UIFont.init(name: "HelveticaNeue-Light", size: 18)
        label.font = font
        
        label.text = "Some City"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let  hiLowLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.clear
       
         let font = UIFont.init(name: "HelveticaNeue-Light", size: 28)
        label.font = font
        label.text = "Some City"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currentTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.clear
        //label.font = UIFont.systemFont(ofSize: 90)
        let font = UIFont.init(name: "HelveticaNeue-UltraLight", size: 120)
        //label.font = UIFont.fontWithName:"HelveticaNeue-UltraLight" size:120)
        label.font = font
        label.text = "Some City"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let monSpaceLabel: UILabel = {
        let digitLabel = UILabel()
        digitLabel.textColor = UIColor.red
        digitLabel.textColor = UIColor.white
        digitLabel.text  = "ajTAR123456789"
        digitLabel.backgroundColor = UIColor.clear
      
         let font = UIFont.init(name: "HelveticaNeue", size: 50)
        digitLabel.font = font
        digitLabel.translatesAutoresizingMaskIntoConstraints = false
        return digitLabel
    }()
    
    func setupViews() {
        backgroundColor = UIColor.lightGray
        layer.borderWidth =  1.25
        layer.borderColor = UIColor.green.cgColor
        
        
        addSubview(currentConditLabel)
        addSubview(hiLowLabel)
        addSubview(currentTempLabel)
       
        
        currentConditLabel.topAnchor.constraint(equalTo: self.topAnchor)
        currentConditLabel.leftAnchor.constraint(equalTo: self.leftAnchor)
        
        hiLowLabel.topAnchor.constraint(equalTo: currentConditLabel.bottomAnchor).isActive = true
        hiLowLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
         currentTempLabel.topAnchor.constraint(equalTo: hiLowLabel.bottomAnchor ).isActive = true
        currentTempLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
