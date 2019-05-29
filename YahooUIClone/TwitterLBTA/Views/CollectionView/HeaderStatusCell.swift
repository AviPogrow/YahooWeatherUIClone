//
//  HeaderStatusView.swift
//  TwitterLBTA
//
//  Created by user on 5/20/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit



@available(iOS 11.0, *)

class HeaderStatusCell: UICollectionReusableView {
    
    let plusButton: UIButton = {
        let button = UIButton(type: UIButtonType.roundedRect)
        button.backgroundColor = UIColor.darkGray
        button.tintColor = UIColor.white
        button.setTitle("+", for: UIControlState.normal)
        let size = CGSize(width: 44, height: 44)
        button.sizeThatFits(size)
       // button.translatesAutoresizingMaskIntoConstraints = false
        let targetSize = CGSize(width: 30, height: 30)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        //button.frame =
        
        return button
    }()
    
    let pointerImageView: UIImageView = {
        let image = UIImage(named: "arrow")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.numberOfLines = 2
        let arrowString = "➚"
        //let arrowString.font = UIFont.systemFontSize(30)
        label.text =  "New York\n4:06AM PDT"
        //label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    let openButtton: UIButton = {
    let menuButton = UIButton(type: .roundedRect)
    //menuButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    
    menuButton.setTitle("Menu", for: .normal)
    //menuButton.setBackgroundImage(UIImage(named: "menu"), for: .normal)
    menuButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    //menuButton.setImage(UIImage(named: "menu"), for: .normal)
    menuButton.setTitleColor(.white, for: .normal)
    menuButton.tintColor = UIColor.white
    menuButton.backgroundColor = UIColor.darkGray
    menuButton.alpha = 0.75
    menuButton.addTarget(self, action:
    #selector(menuTapped), for: .touchUpInside)
        
    
  
    return menuButton
    }()
    
    
    //this gets called when a cell is dequeued
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        timeLabel.addSubview(pointerImageView)
        
        let stackView = UIStackView(arrangedSubviews: [openButtton,timeLabel,plusButton])
        stackView.axis = .horizontal
        stackView.backgroundColor = UIColor.red
        stackView.alignment = .fill
        stackView.spacing = 4.0
        stackView.distribution = .fillEqually
        stackView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height - 4)
        
        addSubview(stackView)
        
        let separatorView = UIView(frame: CGRect(x: 0, y: Int(bounds.maxY - 3), width: Int(self.bounds.width), height: 1))
        separatorView.backgroundColor = UIColor.yellow
        addSubview(separatorView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func menuTapped(_ sender: Any) {
        postMenuTappedNotification()
    }
       
    func configureForLocation(location: Location) {
        
        if location != nil {
        let rawDate = location.date
           
        //let displayString = rawDate.timeAgoDisplay()
            
         let displayString = format(date: location.date)
            
        timeLabel.text = "\(location.name)" + "\n" + displayString
        }
    }
    
    func postMenuTappedNotification() {
        
        NotificationCenter.default.post(name: .MenuTappedNotification, object: openButtton)
        
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
    
    func format(date: Date) -> String {
        return dateFormatter.string(from: date).uppercased()
    }
    
    
}

import Foundation

//let newDateFormatter = ISO8601DateFormatter()
//let modifiedDate = newDateFormatter.date(from: location.date)
// print("the iso date is \(modifiedDate)")

let now = Date()
let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24)

//let dateString = pastDate.timeAgoDisplay()
extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        if secondsAgo < minute {
            return "\(secondsAgo) seconds ago"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute) minutes ago"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour) hours ago"
        } else if secondsAgo < week {
            return "\(secondsAgo / day) days ago"
        }
        
        return "\(secondsAgo / week) weeks ago"
    }
}
