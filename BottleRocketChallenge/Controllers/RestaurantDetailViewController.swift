//
//  RestaurantDetailViewController.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 3/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailViewController: MapBaseViewController {
    
    
    @IBOutlet var nameLabel:UILabel?
    @IBOutlet var categoryLabel:UILabel?
    @IBOutlet var phoneLabel:UILabel?
    @IBOutlet var addressLabel:UILabel?
    @IBOutlet var twitterLabel:UILabel?
    @IBOutlet var panelView:UIView?
    var item:Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        showDetails(with: self.item)
        
        setupMapView()
        
    }
    
    func showDetails(with item:Restaurant?){
        
        DispatchQueue.main.async { [weak self] in
            
            self?.nameLabel?.text = self?.item?.name ?? ""
            self?.categoryLabel?.text = self?.item?.category ?? ""
            self?.phoneLabel?.text = self?.item?.contact?.formattedPhone ?? ""
            self?.addressLabel?.text = self?.item?.location?.formattedAddress.joined(separator: " ,") ?? ""
            self?.twitterLabel?.text = self?.item?.contact?.twitter?.isEmpty ?? true ?  "" : "@\(self?.item?.contact?.twitter ?? "")"
        }
    }
    
    func setupViews(){
        
        DispatchQueue.main.async { [weak self] in
            
            self?.addRestaurantDetailNavigationStyle(title: self?.item?.name ?? "")
        
            self?.panelView?.backgroundColor = Color.detailViewColor
            //Add Style
            self?.nameLabel?.textColor = Color.titleColor
            self?.nameLabel?.font = Font.nameFont
            
            self?.categoryLabel?.textColor = Color.titleColor
            self?.categoryLabel?.font = Font.categoryFont
            
            self?.phoneLabel?.textColor = Color.detailFontColor
            self?.phoneLabel?.font = Font.detailsFont
            
            self?.addressLabel?.textColor = Color.detailFontColor
            self?.addressLabel?.font = Font.detailsFont
            self?.addressLabel?.numberOfLines = 0
            
            self?.twitterLabel?.textColor = Color.detailFontColor
            self?.twitterLabel?.font = Font.detailsFont
        }
        
    }
    
    func setupMapView(){

        guard let lat = CLLocationDegrees(exactly: self.item?.location?.lat ?? 0.0) else {return}
        guard let lng = CLLocationDegrees(exactly: self.item?.location?.lng ?? 0.0) else {return}
        self.centerMapOnLocation(lat: lat , long: lng)
        let annotation = self.createMapAnnotation(location: CLLocationCoordinate2D(latitude: lat, longitude: lng) , title: self.item?.name ?? "", name: self.item?.category ?? "")
        self.addMapAnnotation(annotation: annotation)
        
    }
    
}
