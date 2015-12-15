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
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    // MARK: - Style view
    
    func styleView() {
        statusView.backgroundColor = UIColor.clearColor()
        ShadowView(informationBar)
    }
    

}
