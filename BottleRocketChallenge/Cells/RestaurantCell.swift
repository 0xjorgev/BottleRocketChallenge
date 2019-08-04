//
//  RestaurantCell.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 3/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class RestaurantCell: UICollectionViewCell {
    
    @IBOutlet var backgroundImage:UIImageView?
    @IBOutlet var nameLabel:UILabel?
    @IBOutlet var categoryLabel:UILabel?
    var item:Restaurant? {
        didSet{
            
            DispatchQueue.main.async { [weak self] in
                
                self?.setupViews()
                
                self?.nameLabel?.text = self?.item?.name ?? ""
                
                self?.categoryLabel?.text = self?.item?.category ?? ""
                
            }
        }
    }
    
    private func setupViews(){
        
        nameLabel?.addTitleStyle()
        
        categoryLabel?.addCategoryStyle()
        
    }
    
}
