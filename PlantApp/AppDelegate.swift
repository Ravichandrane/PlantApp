//
//  AppDelegate.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 14/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Override point for customization after application launch.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UINavigationBar.appearance().barStyle = .Black
        UINavigationBar.appearance().barTintColor = UIColorFromRGBA("15E9A6", alpha: 1.0)
        UINavigationBar.appearance().translucent = false
        
        // Init Parse
        
        Parse.setApplicationId("ueCOfDXzBxiaF8WtBvbZZ6XzPfNdNOLLc2WHNQyN", clientKey: "eyXFTMo6pDdtq0itfyhlcQc1l2VF7FTb9hEjhTFn")
        
        // If it's the first time show the OnboardingView else show the HomeView
        
        let OnboardingViewControlelr = storyboard.instantiateViewControllerWithIdentifier("onboardingView")
        let HomeViewController = storyboard.instantiateViewControllerWithIdentifier("homeViewNavigation")
        
        if LocalStore.isFirstTime() == true {
            if self.window != nil {
                self.window!.rootViewController = HomeViewController
            }
        }else{
            if self.window != nil {
                self.window!.rootViewController = OnboardingViewControlelr
            }
        }
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

