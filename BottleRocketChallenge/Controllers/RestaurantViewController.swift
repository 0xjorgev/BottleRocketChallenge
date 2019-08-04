//
//  RestaurantViewController.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 3/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class RestaurantViewController: BaseCollectionViewController<Restaurant, UICollectionViewCell>  {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RestaurantCell
        
        cell.item = self.items?[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let detail = storyboard.instantiateViewController(withIdentifier: "RestaurantDetailViewController") as! RestaurantDetailViewController
        
        detail.item = self.items?[indexPath.row]
        
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    override func getData(){
        
        Service.shared.fetchRestaurants(component: "br-codingexams/restaurants.json") { (result, error) in
            
            if error == nil {
                
                self.items = result?.restaurants
                
            } else {
                
                print("Error: \(error?.localizedDescription ?? "Error fetching data")")
            }
            
            self.stopSpinner()
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addRestaurantNavigationStyle()
    }

}
