//
//  TabBarViewController.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 3/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .white
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let lunchController = mainStoryboard.instantiateViewController(withIdentifier: "RestaurantViewController") as! RestaurantViewController
        
        let internet = BrowserViewController()
        let lunchNavigation = UINavigationController(rootViewController: lunchController)
        let internetNavigation = UINavigationController(rootViewController: internet)
        lunchNavigation.navigationBar.barTintColor = Color.navigationBarColor
        lunchNavigation.navigationBar.tintColor = Color.navigationBarItemsColor
        internetNavigation.navigationBar.barTintColor = Color.navigationBarColor
        internetNavigation.navigationBar.tintColor = Color.navigationBarItemsColor
        lunchController.tabBarItem = UITabBarItem.init(title: "lunch", image: UIImage(named: "tab_lunch"), tag: 0)
        internet.tabBarItem = UITabBarItem.init(title: "internets", image: UIImage(named: "tab_internets"), tag: 1)
        
        self.viewControllers = [lunchNavigation, internetNavigation]
        // Do any additional setup after loading the view.
    }
}
