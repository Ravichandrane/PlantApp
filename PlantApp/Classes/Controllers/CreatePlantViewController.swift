//
//  CreatePlantViewController.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 16/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

class CreatePlantViewController: UIViewController {

    // MARK: - IBOutlet & Variable
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    // MARK: - Style view
    
    func styleView() {
        self.navigationItem.title = "Give me a name"
        navigationIcon("BackBtn", action: "previousView:", target: self, navigationItem: navigationItem, position: "left")
    }
    
    // Action
    
    func previousView(sender: UIButton) {
        self.performSegueWithIdentifier("backToAddPlantView", sender: self)
    }


}
