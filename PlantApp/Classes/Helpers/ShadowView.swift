//
//  ShadowView.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 15/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

func ShadowView(view: UIView) {
    view.layer.shadowColor = UIColorFromRGBA("E5E5E5", alpha: 1).CGColor
    view.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    view.layer.shadowOpacity = 0.8
    view.layer.shadowRadius = 0.5
    view.layer.masksToBounds = true
    view.clipsToBounds = false
}