//
//  ViewController.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 14/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit
import Parse
import BTNavigationDropdownMenu

class ViewController: UIViewController {

    // MARK: - IBOutle & Variable
    
    let items = ["Home", "Status", "Notifications"]
    var menuView: BTNavigationDropdownMenu!
    
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var notificationView: UIView!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    // MARK: - Style view
    
    func styleView() {
        
        hideView(false, StatusView: true, notificationView: true)
        
        let menuView = BTNavigationDropdownMenu(title: items.first!, items: items)
        menuView.maskBackgroundColor = UIColor.blackColor()
        menuView.cellTextLabelColor = UIColor.whiteColor()
        menuView.cellSelectionColor = UIColorFromRGBA("13EA6E", alpha: 0.5)
        menuView.cellSeparatorColor = UIColor.clearColor()
        menuView.checkMarkImage = UIImage(named: "")
        menuView.animationDuration = 0.35
        menuView.maskBackgroundOpacity = 0.8
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            switch indexPath {
                case 0:
                    self.hideView(false, StatusView: true, notificationView: true)
                case 1:
                    self.hideView(true, StatusView: false, notificationView: true)
                case 2:
                    self.hideView(true, StatusView: true, notificationView: false)
                default:
                    break
            }
        }
        
        self.navigationItem.titleView = menuView
    }
    
    // MARK: - Function
    
    func hideView(homeView: Bool, StatusView: Bool, notificationView: Bool) {
        self.homeView.hidden = homeView
        self.statusView.hidden = StatusView
        self.notificationView.hidden = notificationView
    }
    
}

