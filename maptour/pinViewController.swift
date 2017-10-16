//
//  pinViewController.swift
//  maptour
//
//  Created by D7703_29 on 2017. 10. 16..
//  Copyright © 2017년 D7703_29. All rights reserved.
//

import UIKit
import MapKit
class pinViewController: UIViewController {
    @IBOutlet weak var pinmap: MKMapView!
    var pinaddress : String?
    var pintitle : String?
    var lat: Double?
    var long: Double?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let geoCoder2: CLGeocoder = CLGeocoder()
        
        geoCoder2.geocodeAddressString(pinaddress!, completionHandler: {
            (placemarks, error) -> Void in
            
            if error != nil {
                print(error!)
            } else {
                
                
                let Coordinate = placemarks?[0]
                self.lat = Coordinate?.location?.coordinate.latitude
                self.long = Coordinate?.location?.coordinate.longitude
                
                               
                let center = CLLocationCoordinate2DMake(self.lat!, self.long!)
                let span = MKCoordinateSpanMake(0.05, 0.05)
                let region = MKCoordinateRegionMake(center, span)
                self.pinmap.setRegion(region, animated: true)
                
                // pin annotation
                let anno = MKPointAnnotation()
                anno.coordinate.latitude = self.lat!
                anno.coordinate.longitude = self.long!
                anno.title = self.pintitle!
                anno.subtitle = self.pinaddress!
                self.pinmap.addAnnotation(anno)
                self.pinmap.selectAnnotation(anno, animated: true)
            }
            
        })
        
    }
        
    }

    

    


