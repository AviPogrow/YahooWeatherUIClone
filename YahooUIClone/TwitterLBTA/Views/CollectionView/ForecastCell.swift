//
//  CollectionViewCell.swift
//  TwitterLBTA
//
//  Created by user on 5/24/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit


class ForeCastTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


class ForecastCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var location: Location!
    
    var daysArray = ["Sunday", "Monday", "Tuesday","Wednesday","Thursday"]
    var iconsArray = ["🌨","🌩","⛈","🌥","☁️","⛅️","🌤","☀️"]
    //didSet location: Location {
    
   // }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let rect = CGRect(x: 16, y: 16, width: 200, height: 200)
        let tableView = UITableView(frame: rect)
       
        
        tableView.register(ForeCastTableViewCell.self, forCellReuseIdentifier: String(describing: ForeCastTableViewCell.self))
    
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = UIColor.clear
        
        addSubview(tableView)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ForeCastTableViewCell.self), for: indexPath)
        
        let currentDay = daysArray[indexPath.row]
        let currentIcon = iconsArray[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = currentDay + "          " + currentIcon
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
