//
//  Shot.swift
//  Booster
//
//  Created by James Taylor on 11/1/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit


class Shot {
    // MARK: Properties
    
    var description: String
    //var photo: UIImage?
    //var rating: Int
    
    // MARK: Initialization
    
    init?(description: String) {
        // Initialize stored properties.
        self.description = description
        //self.photo = photo
        //self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative.
        if description.isEmpty {
            return nil
        }
    }
    
}
