//
//  MapBaseViewController.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 4/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapBaseViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet var mapView:MKMapView?
    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 2000

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView?.delegate = self
    }
    
    func centerMapOnLocation(lat:CLLocationDegrees, long:CLLocationDegrees) {
        let location = CLLocation(latitude: lat, longitude: long)
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView?.setRegion(coordinateRegion, animated: true)
    }
    
    func createMapAnnotation(location:CLLocationCoordinate2D, title:String, name:String) -> MKAnnotation {
        return RestaurantMapAnnotation.init(title: title, name:name, coordinate: location)
    }
    
    func addMapAnnotation(annotation:MKAnnotation) {
        self.mapView?.addAnnotation(annotation)
    }
    
    @IBAction func dismissView(sender:UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
