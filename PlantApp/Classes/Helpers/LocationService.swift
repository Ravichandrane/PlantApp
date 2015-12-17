//
//  LocationService.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 16/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationServiceDelegate: class {
    func didFindNewLocation(latitude:Double, longitude:Double, placeName:String)
}

class LocationService: NSObject, CLLocationManagerDelegate {
    
    static let sharedInstance = LocationService()
    
    // MARK: - Variable
    
    var locationManager: CLLocationManager?
    
    var userLatitude: Double?
    var userLongitude: Double?
    var userPlace: String?
    weak var delegate: LocationServiceDelegate?
    
    // MARK: - Init
    
    override init() {
        super.init()
        
        self.locationManager = CLLocationManager()
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager?.distanceFilter = kCLDistanceFilterNone
        self.locationManager?.delegate = self
    
    }
    
    // MARK: - Function
    
    func requestAlawaysAutorization() {
        locationManager?.requestAlwaysAuthorization()
    }
    
    func startUpdatingLocation() {
        self.locationManager?.startUpdatingLocation()
        requestAlawaysAutorization()
    }
    
    func stopUpdatingLocation() {
        self.locationManager?.stopUpdatingLocation()
    }
    
    // MARK: - CoreLocation Delegate
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        stopUpdatingLocation()
        
        let location: AnyObject? = (locations as NSArray).lastObject
        let currentLocation = location as! CLLocation
        let coordinate = currentLocation.coordinate
        
        self.userLatitude  = coordinate.latitude
        self.userLongitude = coordinate.longitude
        
        let locations = CLLocation(latitude: userLatitude!, longitude: userLongitude!)
        
        CLGeocoder().reverseGeocodeLocation(locations, completionHandler: { (placeUser, error) -> Void in
            
            if error != nil {
                NSNotificationCenter.defaultCenter().postNotificationName("AirplaneMode", object: nil)
                self.stopUpdatingLocation()
                return
            }
            
            if placeUser!.count > 0 {
                self.stopUpdatingLocation()
                let userLocation = placeUser![0]
                self.userPlace = userLocation.locality
                self.delegate?.didFindNewLocation(self.userLatitude!, longitude: self.userLongitude!, placeName: self.userPlace!)
            }
            
        })
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch status{
            case .AuthorizedAlways:
                startUpdatingLocation()
            case .NotDetermined:
                requestAlawaysAutorization()
            case .Restricted, .Denied:
                NSNotificationCenter.defaultCenter().postNotificationName("AuthorizationDenied", object: nil)
            default:
                stopUpdatingLocation()
        }
        
    }
    
    
}
