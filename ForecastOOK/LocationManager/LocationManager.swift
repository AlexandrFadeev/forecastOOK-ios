//
//  LocationManager.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 26.03.2024.
//

import CoreLocation

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var locationError: LocationError?
    
    override init() {
        super.init()
        
        manager.delegate = self
    }
    
    func requestLocation() {
        if manager.authorizationStatus == .notDetermined {
            manager.requestLocation()
        } else if manager.authorizationStatus == .denied {
            locationError = LocationError.permissionAccessFailed
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        if manager.authorizationStatus == .denied {
            locationError = LocationError.permissionAccessFailed
        }
    }
}
