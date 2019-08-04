//
//  RestaurantMapAnnotation.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 4/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit
import MapKit

class RestaurantMapAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, name: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.name = name
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return name
    }

}
