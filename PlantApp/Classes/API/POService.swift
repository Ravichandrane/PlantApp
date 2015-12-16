//
//  POService.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 16/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import Foundation
import Alamofire


struct POService {
    
    // MARK: - Settings API
    
    private static let apiKey = valueForAPIKey(keyname: "API_CLIENT_KEY")
    private static let baseUrl =  "https://api.forecast.io/forecast/\(apiKey)/"
    
    // MARK: - Routes
    
    private enum Path: CustomStringConvertible {
        case WeatherGeoloc(lat: Double, lng: Double)
        
        var description: String {
            switch self {
                case .WeatherGeoloc(let lat, let lng):  return "\(lat),\(lng)"
            }
        }
    }
    
    // MARK: - Get current Weather
    
    static func getCurrentWeather(userLatitude: Double, userLongitude: Double, completionHandler:(response: String, error: String) -> ()) {
        
        let urlString = baseUrl + Path.WeatherGeoloc(lat: userLatitude, lng: userLongitude).description
        
        Alamofire.request(.GET, urlString).responseJSON { (response) -> Void in
            print(response)
        }
        
    }
    
    
    
    
    
    
}
