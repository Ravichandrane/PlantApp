//
//  AlertView.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 17/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

func showSimpleAlertWithTitle(title: String!, message: String, viewController: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
    alert.addAction(action)
    viewController.presentViewController(alert, animated: true, completion: nil)
}


func showSimpleAlertWithSettings(title: String!, message: String, viewController: UIViewController) {
    let alert   = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    let action  = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
    let setting = UIAlertAction(title: "Settings", style: .Default, handler: { (action) -> Void in
        if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
            UIApplication.sharedApplication().openURL(url)
        }
    })
    alert.addAction(action)
    alert.addAction(setting)
    viewController.presentViewController(alert, animated: true, completion: nil)
}