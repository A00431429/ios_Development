//
//  MapViewController.swift
//  assignment2
//
//  Created by name on 2019-08-16.
//  Copyright © 2019 cda. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var wonderLocation: CLLocation?
    var wonderLocationNew: CLLocation?
    var wonderName : String?
    var currentLocation: CLLocation?
    let manager = CLLocationManager()
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("Reached Map")
        
        map.delegate = self
        setUpMapView()
        setUPLocationManager()


        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        manager.stopUpdatingLocation()
    }
    
    func setUpMapView() {
        let coordinate = wonderLocation?.coordinate
        if let coordinate = coordinate, let name = wonderName {
            let annotation = MKPointAnnotation()
            annotation.title = name
            annotation.coordinate = coordinate
            map.addAnnotation(annotation)
            zoom(annotation.coordinate)
        }
        
        let coordinateNew = wonderLocationNew?.coordinate
        if let coordinateNew = coordinateNew {
            let annotationNew = MKPointAnnotation()
            annotationNew.title = "New"
            annotationNew.coordinate = coordinateNew
            
            map.addAnnotation(annotationNew)
        }
        
        map.showsUserLocation = true
    }
    
    func zoom(_ location: CLLocationCoordinate2D) {
        let radius = 1000
        let region = MKCoordinateRegion(center: location, latitudinalMeters: CLLocationDistance(Double(radius) * 2.0), longitudinalMeters: CLLocationDistance(Double(radius) * 2.0))
        map.setRegion(region, animated: true)
    }
    
    func setUPLocationManager() {
        if CLLocationManager.authorizationStatus() == .notDetermined{
            manager.requestWhenInUseAuthorization()
        }
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.delegate = self
        manager.stopUpdatingLocation()
    }

}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        let view = MKPinAnnotationView (annotation: annotation, reuseIdentifier: "reusePin")
        view.canShowCallout = true
        view.rightCalloutAccessoryView = UIButton (type: .detailDisclosure) as UIView
        view.pinTintColor = UIColor.red
        if annotation.title == "New"{
            view.pinTintColor = UIColor.blue
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let location = view.annotation
        let launchingOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        if let coordinate = view.annotation?.coordinate {
            let mapItem = location?.mapItem(coordinate: coordinate)
            mapItem?.openInMaps(launchOptions: launchingOptions)
        }
    }
}

extension MKAnnotation {
    func mapItem(coordinate: CLLocationCoordinate2D) -> MKMapItem {
        let placeMark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placeMark)
        return mapItem
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.currentLocation = location
        updateLocation(location)
    }
    
    private func updateLocation(_ currentLocation: CLLocation){
        self.currentLocation = currentLocation
    }
}
