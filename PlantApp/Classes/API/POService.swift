//
//  POService.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 16/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
    
    static func getCurrentWeather(userLatitude: Double, userLongitude: Double, completionHandler:(response: Weather?, error: NSError?) -> ()) {
        
        let urlString = baseUrl + Path.WeatherGeoloc(lat: userLatitude, lng: userLongitude).description
        let parameters = [
            "units" : "si"
        ]
        
        Alamofire.request(.GET, urlString, parameters: parameters).responseJSON { (response) -> Void in
            
            switch response.result {
                case .Success(let value):
                    
                    let jsonData = JSON(value)
                    let data = jsonData["currently"]
                    let temperature = data["temperature"].int
                    let humidity = data["humidity"].double 
                    let windSpeed = data["windSpeed"].double
                    let cloudCover = data["cloudCover"].double
                    
                    let setValue = Weather (temperature: temperature, humidity: humidity, windSpeed: windSpeed, cloudCover: cloudCover)
                    
                    completionHandler(response: setValue, error: nil)
                break
                case .Failure(let error):
                    completionHandler(response: nil, error: error)
                break
            }
            
        }
        
    }
    

    
}
