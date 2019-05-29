//
//  Location.swift
//  TwitterLBTA
//
//  Created by user on 5/20/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit

class Location: Decodable {
    var name: String
    var imageName: String
    var date: Date

    init(name: String, imageName: String) {
        
     self.name = name
     self.imageName = imageName
     self.date = Date()
    }
    
    var image: UIImage {
    return UIImage(imageLiteralResourceName: imageName)
    
    }
    
    class func createLocationsArray() -> [Location] {
        var locationsArray = [Location]()
        
        let location1 = Location(name: "NewYork", imageName: "NewYork")
        let location2 = Location(name: "Boston", imageName: "Boston")
        let location3 = Location(name: "Chicago", imageName: "Chicago")
        locationsArray = [location1,location2, location3]
        
        return locationsArray
    }
}
