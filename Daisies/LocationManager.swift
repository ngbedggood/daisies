//
//  LocationManager.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 06/01/2025.
//

import Foundation
import CoreLocation

@Observable // This is the right way

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var location: CLLocation?
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    // Delegate methods - Apple has created and will call but I need to fill out
    func requestLocation() {
        manager.requestLocation()
    }
     
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return } // Use last location as location
        location = newLocation
        
        // Uncomment this if you onely want the location once, not repeatedly
        //manager.stopUpdatingLocation()
    }
    
}
