//
//  RestaurantMapViewController.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 4/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit
import MapKit

class RestaurantMapViewController: MapBaseViewController {
    var items:[Restaurant]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let annotations = items?.compactMap{ rest -> RestaurantMapAnnotation in
            let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(rest.location?.lat ?? 0.0), longitude: CLLocationDegrees(rest.location?.lng ?? 0.0))
            return RestaurantMapAnnotation(title: rest.name, name: rest.category, coordinate: coordinate)
        }
        DispatchQueue.main.async { [weak self] in
            _ = annotations?.compactMap{
                self?.addMapAnnotation(annotation: $0)
            }
            self?.centerMapOnLocation(lat: CLLocationDegrees(self?.items?.first?.location?.lat ?? 0.0), long: CLLocationDegrees(self?.items?.first?.location?.lng ?? 0.0))
        }
        self.addDismissItem()
    }
}
