//
//  NavigationBarIcon.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 14/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

func navigationIcon(name: String, action: String, target: AnyObject, navigationItem: UINavigationItem, position: String) {
    
    let Icon = UIImage(named: "\(name)")
    let IconImgWidth = Icon?.size.width
    let IconImgHeight = Icon?.size.height
    let buttonItem:UIButton = UIButton(frame: CGRect(x: 0,y: 0,width: IconImgWidth!, height: IconImgHeight!))
    buttonItem.setBackgroundImage(Icon, forState: .Normal)
    buttonItem.addTarget(target, action: Selector("\(action)"), forControlEvents: UIControlEvents.TouchUpInside)
    
    if position == "left" {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonItem)
    }else{
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonItem)
    }
    
}