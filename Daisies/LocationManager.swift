//
//  LocationManager.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 06/01/2025.
//

import Foundation
import MapKit

@Observable // This is the right way

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var location: CLLocation?
    private let manager = CLLocationManager()
    var errorMessage: String?
    
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
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
        
        // Uncomment this if you only want the location once, not repeatedly
        //manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatus = manager.authorizationStatus
        
        // Try to catch all the change in authorization states including potential future additions
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Location Manger authorization granted.")
            manager.startUpdatingLocation()
        case .denied, .restricted:
            print("Location Manager authorization denied.")
            errorMessage = ("Location Manager access denied :(")
            manager.stopUpdatingLocation()
        case .notDetermined:
            print("Location Manager authorization not determined.")
            manager.requestWhenInUseAuthorization()
            errorMessage = ("Location Manager authorization not determined")
        @unknown default:
            print("There might be a new LocationManager enum!")
            manager.requestWhenInUseAuthorization()
        }
        
    }
    
    // Error messaging
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        errorMessage = error.localizedDescription
        print("ERROR Location Manager: \(errorMessage ?? "n/a???")")
    }
    
}
