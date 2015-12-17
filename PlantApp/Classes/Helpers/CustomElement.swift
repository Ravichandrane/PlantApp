//
//  CustomElement.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 16/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

func customButton(button: UIButton, text: String, color: String, borderColor: String, alpha: Float, borderWith: CGFloat, cornerRadius: CGFloat, target: AnyObject, action: String) {
    
    button.titleLabel?.font = UIFont.systemFontOfSize(20)
    button.setTitle(text, forState: UIControlState.Normal)
    button.tintColor = UIColorFromRGBA(color, alpha: alpha)
    button.layer.borderColor = UIColorFromRGBA(borderColor, alpha: alpha).CGColor
    button.layer.borderWidth = borderWith
    button.titleLabel?.textAlignment = .Center
    button.layer.cornerRadius = cornerRadius
    button.addTarget(target, action: Selector("\(action)"), forControlEvents: .TouchUpInside)

}