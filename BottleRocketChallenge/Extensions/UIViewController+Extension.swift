//
//  UIViewController+Extension.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 4/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addNavigationTitleStyle(title:String){
        
        let label = UILabel()
        label.text = title
        label.sizeToFit()
        label.font = Font.navigationTitleFont
        label.textColor = Color.titleColor
        label.textAlignment = NSTextAlignment.center
        
        self.navigationItem.titleView = label
    }
    
    func addMapNavigationItem(){
        
        let barButton = UIBarButtonItem.init(image: UIImage(named:"icon_map"), style: .plain, target: self, action: #selector(presentMapView))
        
        self.navigationItem.rightBarButtonItem = barButton
        
    }
    
    func addCustomBackItem(){
        
        let barButton = UIBarButtonItem.init(image: UIImage(named:"ic_webBack"), style: .plain, target: self, action: #selector(popToView))
        
        self.navigationItem.leftBarButtonItem = barButton
        
    }
    
    func addDismissItem(){
        
        let barButton = UIBarButtonItem.init(title: "Done", style: .plain, target: self, action: #selector(dismissMapView))
            
            //.init(image: UIImage(named:"ic_webBack"), style: .plain, target: self, action: #selector(popToView))
        
        self.navigationItem.rightBarButtonItem = barButton
        
    }
    
    @objc func dismissMapView(sender:UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func presentMapView(sender:UIBarButtonItem){
        
        //RestaurantMapViewController
        
        //print("MapView ... !")
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let maps = storyboard.instantiateViewController(withIdentifier: "RestaurantMapViewController") as! RestaurantMapViewController
        
        //detail.item = self.items?[indexPath.row]
        
        //self.navigationController?.pushViewController(detail, animated: true)
        
        self.present(maps, animated: true, completion: nil)
        
    }
    
    @objc func popToView(sender:UIBarButtonItem){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func addRestaurantNavigationStyle(){
        
        addNavigationTitleStyle(title: "Lunch Tyme")
        
        addMapNavigationItem()
    }
    
    func addRestaurantDetailNavigationStyle(title:String){
        
        addNavigationTitleStyle(title: title)
        
        addMapNavigationItem()
        
        addCustomBackItem()
    }
    
}
