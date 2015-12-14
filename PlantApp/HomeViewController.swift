//
//  HomeViewController.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 14/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit
import Parse
import BTNavigationDropdownMenu

class HomeViewController: UIViewController {

    // MARK: - IBOutle & Variables
    
    let items = ["Status", "", "Notification"]
    var menuView: BTNavigationDropdownMenu!
    
    // MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    // MARK: - Init Style 
    
    func styleView() {
        
        let menuView = BTNavigationDropdownMenu(title: items.first!, items: items)
        menuView.maskBackgroundColor = UIColor.blackColor()
        menuView.cellTextLabelColor = UIColor.whiteColor()
        menuView.cellSelectionColor = UIColorFromRGBA("13EA6E", alpha: 0.5)
        menuView.checkMarkImage = UIImage(named: "")
        menuView.animationDuration = 0.35
        menuView.maskBackgroundOpacity = 0.8
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
        }
        
        self.navigationItem.titleView = menuView

    }
    
    
}

