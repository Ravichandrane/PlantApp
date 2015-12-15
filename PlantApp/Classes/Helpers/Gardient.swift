//
//  Gardient.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 15/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

extension CAGradientLayer {

    func onboardingGardient() -> CAGradientLayer{
        let topColor = UIColorFromRGBA("13EA6E", alpha: 1.0)
        let bottomColor = UIColorFromRGBA("15E9A6", alpha: 1.0)
    
        let gardientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gardientLocation: [CGFloat] = [0.0, 1.0]
        let gardientLayer: CAGradientLayer = CAGradientLayer()
    
        gardientLayer.colors = gardientColors
        gardientLayer.locations = gardientLocation
    
        return gardientLayer
    }

}
