//
//  LocalStore.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 16/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import Foundation

struct LocalStore {
    
    static let userDefault = NSUserDefaults.standardUserDefaults()
    
    // MARK: - Set value
    
    static func isFirstTime(isFirstTime: Bool?) {
        userDefault.setBool(isFirstTime!, forKey: "isFirstTime")
    }
    
    // MARK: - Get value
    
    static func isFirstTime() -> Bool? {
        return userDefault.boolForKey("isFirstTime")
    }
    
    // MARK: - Clean NSUserDefaults
    
    static func cleanUser() {
        userDefault.removeObjectForKey("isFirstTime")
    }
    
}