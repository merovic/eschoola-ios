//
//  SchoolLocationViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/14/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit
import MapKit

class SchoolLocationViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationmanger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationmanger.delegate = self as? CLLocationManagerDelegate
        locationmanger.requestWhenInUseAuthorization()
        locationmanger.startUpdatingLocation()
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(31.006512, 29.814974)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "El-Eleem School"
        annotation.subtitle = "Location"
        
        mapView.addAnnotation(annotation)
    }
    

}
