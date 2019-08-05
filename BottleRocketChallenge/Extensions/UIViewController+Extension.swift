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
    
    func addCustomBackItem(){
        let barButton = UIBarButtonItem.init(image: UIImage(named:"ic_webBack"), style: .plain, target: self, action: #selector(popToView))
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func addDismissItem(){
        let barButton = UIBarButtonItem.init(title: "Done", style: .plain, target: self, action: #selector(dismissMapView))
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func dismissMapView(sender:UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func presentMapView(sender:UIBarButtonItem){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let maps = storyboard.instantiateViewController(withIdentifier: "RestaurantMapViewController") as! RestaurantMapViewController
        self.present(maps, animated: true, completion: nil)
    }
    
    @objc func popToView(sender:UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
    
    func addRestaurantNavigationStyle(){
        addNavigationTitleStyle(title: "Lunch Tyme")
    }
    
    func addRestaurantDetailNavigationStyle(title:String){
        addNavigationTitleStyle(title: title)
        addCustomBackItem()
    }
    
    func placePhoneCall(number:String)  {
        guard let url: URL = URL(string: "TEL://\(number)") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func twitterProfilet(account:String)  {
        let appURL = URL(string: "twitter://user?screen_name=\(account)")!
        let webURL = URL(string: "https://twitter.com/\(account)")!
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
        } else {
            UIApplication.shared.open(webURL)
        }
    }
}
