//
//  InterfaceController.swift
//  WatchDemo Extension
//
//  Created by Suman on 5/3/17.
//  Copyright © 2017 Suman. All rights reserved.
//

import WatchKit
import Foundation
import CoreLocation

class InterfaceController: WKInterfaceController {

    @IBOutlet var lblHeader: WKInterfaceLabel!
    var locationManager = CLLocationManager()
    var aryLocation:[CLLocation] = []
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }
    
    override func willActivate() {
        super.willActivate()
        self.initLocationManager()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    func initLocationManager() {
        self.locationManager.delegate = self
        self.locationManager.distanceFilter  = 40 // Must move at least 1km
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func getPlaceName(location:CLLocation) {
        debugPrint(location.timestamp)
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
            if let error = error {
                debugPrint("Unable to Reverse Geocode Location (\(error.localizedDescription))")
            }
            else {
                if let placemarks = placemarks, let placemark = placemarks.first {
                    debugPrint(placemark.country!)
                    debugPrint(placemark.locality!)
                    debugPrint(placemark.subLocality!)
                    debugPrint(placemark.thoroughfare!)
                    debugPrint(placemark.postalCode!)
                    debugPrint(placemark.subThoroughfare!)
                }
            }
        })
    }
}

extension InterfaceController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if aryLocation.count < 1 {
            aryLocation.append(manager.location!)
            let location = CLLocation(latitude: 23.0225, longitude: 72.5714)
            self.getPlaceName(location: location)
        }
    }
    
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            debugPrint(".NotDetermined")
            break
            
        case .authorizedWhenInUse:
            debugPrint(".Authorized")
            self.locationManager.startUpdatingLocation()
            break
            
        case .denied:
            debugPrint(".Denied")
            break
            
        default:
            debugPrint("Unhandled authorization status")
            break
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint("Error")
    }
    
}
