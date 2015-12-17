//
//  Weather.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 16/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Weather {
    let temperature: Int!
    let humidity: Double!
    let windSpeed: Double!
    let cloudCover: Double!
    let icon: String
}