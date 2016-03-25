//
//  MapViewController.swift
//  D93Conf
//
//  Created by Steve Song on 3/23/16.
//  Copyright © 2016 magendas. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    let lattitude: Double = 37.511577
    let longitude: Double = 126.927141
    
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 300
    func centerMapOnLocation() {
        
        
        let plazaLocation = CLLocationCoordinate2DMake(lattitude, longitude)
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = plazaLocation
        dropPin.title = "Seoul Woman's Plaza"
        mapView.addAnnotation(dropPin)
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(plazaLocation,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    
    let locationManager = CLLocationManager()
    
    func getUserLocation() -> CLLocationCoordinate2D {
        return (locationManager.location?.coordinate)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set location authorization
        // Ask for Authorisation from the User.
        if #available(iOS 8.0, *) {
            self.locationManager.requestAlwaysAuthorization()
        } else {
            // Fallback on earlier versions
        }
        
        // For use in foreground
        if #available(iOS 8.0, *) {
            self.locationManager.requestWhenInUseAuthorization()
        } else {
            // Fallback on earlier versions
        }
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        mapView.showsUserLocation = true
        
        centerMapOnLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    
}

