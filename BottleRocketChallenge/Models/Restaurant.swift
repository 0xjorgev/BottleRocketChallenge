
//
//  Restaurant.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 3/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation

struct Restaurant:Codable {
    let name:String
    let backgroundImageURL:String
    let category: String
    let contact:Contact?
    let location:Location?
    
}
