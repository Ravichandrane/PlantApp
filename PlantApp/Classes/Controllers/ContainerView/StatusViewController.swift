//
//  StatusViewController.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 14/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    // MARK: - IBOutlet & Variable
    
    @IBOutlet weak var informationBar: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var toWater: UIView!
    @IBOutlet weak var infoText: UILabel!
    
    var plant:UserPlants?
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    // MARK: - Style view
    
    func styleView() {
        self.navigationItem.title = "Plant info"
        infoText.text = "To water"
        navigationIcon("BackBtn", action: "previousView:", target: self, navigationItem: navigationItem, position: "left")
        statusView.backgroundColor = UIColor.clearColor()
        ShadowView(informationBar)
        
        toWater.layer.cornerRadius = toWater.frame.width / 2
        toWater.clipsToBounds = true
    }
    
    // MARK: - Action
    @IBAction func toWaterAction(sender: UITapGestureRecognizer) {
        print("water ++")
    }
    
    func previousView(sender: UIButton) {
        self.performSegueWithIdentifier("backToView", sender: self)
    }

}
