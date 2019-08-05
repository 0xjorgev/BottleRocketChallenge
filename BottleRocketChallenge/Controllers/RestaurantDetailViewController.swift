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
    var items:[Restaurant]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        showDetails(with: self.item)
        setupMapView()
        addMapNavigationItem()
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
            let callGesture = UITapGestureRecognizer(target: self, action: #selector(self?.placeCall))
            let twitterGesture = UITapGestureRecognizer(target: self, action: #selector(self?.showTwitterProfile))
            self?.addRestaurantDetailNavigationStyle(title: self?.item?.name ?? "")
            self?.panelView?.backgroundColor = Color.detailViewColor
            self?.nameLabel?.addRestaurantDetailsStyle()
            self?.categoryLabel?.addRestaurantDetailsStyle()
            self?.phoneLabel?.addRestaurantDetailsStyle()
            self?.phoneLabel?.isUserInteractionEnabled = true
            self?.phoneLabel?.addGestureRecognizer(callGesture)
            self?.addressLabel?.addRestaurantDetailsStyle()
            self?.addressLabel?.numberOfLines = 0
            self?.twitterLabel?.addRestaurantDetailsStyle()
            self?.twitterLabel?.isUserInteractionEnabled = true
            self?.twitterLabel?.addGestureRecognizer(twitterGesture)
        }
    }
    
    func setupMapView(){
        guard let lat = CLLocationDegrees(exactly: self.item?.location?.lat ?? 0.0) else {return}
        guard let lng = CLLocationDegrees(exactly: self.item?.location?.lng ?? 0.0) else {return}
        self.centerMapOnLocation(lat: lat , long: lng)
        let annotation = self.createMapAnnotation(location: CLLocationCoordinate2D(latitude: lat, longitude: lng) , title: self.item?.name ?? "", name: self.item?.category ?? "")
        self.addMapAnnotation(annotation: annotation)
    }
    
    func addMapNavigationItem(){
        let barButton = UIBarButtonItem.init(image: UIImage(named:"icon_map"), style: .plain, target: self, action: #selector(addMapItem))
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func addMapItem(sender:UIBarButtonItem){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let maps = storyboard.instantiateViewController(withIdentifier: "RestaurantMapViewController") as! RestaurantMapViewController
        maps.items = self.items
        self.present(maps, animated: true, completion: nil)
    }
    
    @objc func placeCall(sender:AnyObject) {
        self.placePhoneCall(number: self.item?.contact?.phone ?? "")
    }
    
    @objc func showTwitterProfile(sender:AnyObject) {
        guard let account = self.item?.contact?.twitter else { return }
        self.twitterProfilet(account:account)
    }
}
