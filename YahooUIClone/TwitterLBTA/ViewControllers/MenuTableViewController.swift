//
//  MenuTableViewController.swift
//  TwitterLBTA
//
//  Created by user on 5/20/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit

protocol MenuTableViewControllerDelegate: class {
    func didSelectLocation(_ location: Location)
    func closeButtonPressed()
}

@available(iOS 11.0, *)
class MenuTableViewController: UITableViewController {
 
    var locations: [Location]?
    
    weak var delegate: MenuTableViewControllerDelegate?
    
    var dimmingView = UIView()
    
    enum CellIdentifiers {
        static let LocationCell = "LocationCell"
        static let EditLocationsCell = "EditLocationsCell"
        static let FooterView = "FooterView"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.bounces = false
    
        tableView.register(LocationCell.self, forCellReuseIdentifier: CellIdentifiers.LocationCell)
        
        tableView.register(HeaderCell.self, forHeaderFooterViewReuseIdentifier: "TableHeader")
        
        tableView.register(LogoFooterView.self, forHeaderFooterViewReuseIdentifier: CellIdentifiers.FooterView)
     }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
        return locations!.count + 3
        } else {
            return 3
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.LocationCell, for: indexPath) as! LocationCell
       
        
        if indexPath.section == 0 {
        
        if indexPath.section == 0 && indexPath.row < 3 {
            let location = locations![indexPath.row]
        
           cell.location = location 
        }
        else if indexPath.section == 0 && indexPath.row == 3 {
            
            cell.locationLabel.text = "Edit Locations"
            
        }
        else if indexPath.section == 0 && indexPath.row == 4 {
            
            cell.locationLabel.text = "Send Feedback"
            
        }
        else if indexPath.section == 0 && indexPath.row == 5 {
            
            cell.locationLabel.text = "Rate This App"
            
        }
      }
         
        return cell
    }

      override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height / 6
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
        return self.view.bounds.height / 9
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return self.view.bounds.height / 6
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 && indexPath.row == 3 {
            //showPopOverController()
        }
        
        if indexPath.row < 3 {
            let selectedLocation = locations![indexPath.row]
        delegate?.didSelectLocation(selectedLocation)
        }
        
        DispatchQueue.main.async {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
     override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableHeader") as! HeaderCell
        
        headerView.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        return headerView
        } else {
            return nil
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
        
            let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellIdentifiers.FooterView) as! LogoFooterView
        return footerView
        } else {
            return nil
        }
    }
    
    @objc func closeButtonTapped() {
       
      delegate!.closeButtonPressed()
    }
  }
