//
//  AppDelegate.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 3/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBar = TabBarViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = tabBar
        
        window?.makeKeyAndVisible()
        
        for family in UIFont.familyNames {
            print("\(family)")
            
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
        
        return true
    }

    func testService(){
        
        Service.shared.fetchRestaurants(component: "br-codingexams/restaurants.json") { (res, err) in
            
            if err == nil {
                
                print("Restaurants: \(res?.restaurants)")
                
            } else {
                
                print("Error: \(err?.localizedDescription)")
                
            }
        }
        
    }


}

