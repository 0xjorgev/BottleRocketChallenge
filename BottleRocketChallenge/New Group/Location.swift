//
//  Location.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 3/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation
import CoreLocation

struct Location:Codable {
    
    let address:String
    let crossStreet:String?
    let lat:Double
    let lng:Double
    let postalCode:String?
    let cc:String
    let city:String
    let state:String
    let country:String
    let formattedAddress:[String]

}
