//
//  ViewController.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 14/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: - IBOutle & Variable
    
    let items = ["Home", "Game Center", "Notifications"]
    var menuView: BTNavigationDropdownMenu!
    
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var notificationView: UIView!
    
    // MARK: - View

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.enabled = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "autorizationDenied", name: "AuthorizationDenied", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "airplaneMode", name: "AirplaneMode", object: nil)
        styleView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationService.sharedInstance.startUpdatingLocation()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "AuthorizationDenied", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "AirplaneMode", object: nil)
    }
    
    // MARK: - Style view
    
    func styleView() {
        
        hideView(false, StatusView: true, notificationView: true)
        navigationIcon("add_plant", action: "addPlant:", target: self, navigationItem: navigationItem, position: "right")
        
        let menuView = BTNavigationDropdownMenu(title: items.first!, items: items)
        menuView.maskBackgroundColor = UIColor.blackColor()
        menuView.cellTextLabelColor = UIColor.whiteColor()
        menuView.cellSelectionColor = UIColorFromRGBA("13EA6E", alpha: 0.5)
        menuView.cellSeparatorColor = UIColor.clearColor()
        menuView.arrowImage = UIImage(named: "arrowOpen")
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
    
    func addPlant(sender: UIButton) {
        let addViewController = storyboard?.instantiateViewControllerWithIdentifier("addView")
        let nav = UINavigationController(rootViewController: addViewController!)
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    func hideView(homeView: Bool, StatusView: Bool, notificationView: Bool) {
        self.homeView.hidden = homeView
        self.statusView.hidden = StatusView
        self.notificationView.hidden = notificationView
    }
    
    // MARK: - Action
    
    func autorizationDenied() {
        showSimpleAlertWithSettings("Background Location Access Disabled", message: "In order to be get your current weather and save your plant life, please open this app's settings and set location access to 'Always'.", viewController: self)
    }
    
    func airplaneMode() {
       showSimpleAlertWithSettings("Turn Off Airplane Mode or Use Wi-Fi to Access Data", message: "", viewController: self)
    }
    
    // MARK: - Unwind
    
    @IBAction func backLoginView(unwindSegue: UIStoryboardSegue) {}
    
}

