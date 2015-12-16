//
//  CreatePlantViewController.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 16/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

class CreatePlantViewController: UIViewController, UITextFieldDelegate {

    // MARK: - IBOutlet & Variable
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var giveName: UITextField!
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var addButton: UIButton!

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        giveName.delegate = self
        styleView()
    }
    
    // MARK: - Touch & UITextField Delegate
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // MARK: - Style view
    
    func styleView() {
        self.navigationItem.title = "Give me a name"
        navigationIcon("BackBtn", action: "previousView:", target: self, navigationItem: navigationItem, position: "left")
    
        customTextField()
        customButton()
    }
    
    func customTextField() {
        
        giveName.borderStyle = UITextBorderStyle.None
        giveName.placeholder = "Your plant name"
        giveName.autocapitalizationType = .None
        giveName.tintColor = UIColorFromRGBA("15E9A6", alpha: 1.0)
        giveName.textColor = UIColorFromRGBA("15E9A6", alpha: 1.0)
        
    }
    
    func customButton() {
        
        addButton.titleLabel?.font = UIFont.systemFontOfSize(20)
        addButton.setTitle("Ajouter", forState: UIControlState.Normal)
        addButton.tintColor = UIColorFromRGBA("15E9A6", alpha: 1.0)
        addButton.layer.borderColor = UIColorFromRGBA("15E9A6", alpha: 1.0).CGColor
        addButton.layer.borderWidth = 2
        addButton.layer.cornerRadius = 10
        addButton.addTarget(self, action: "addPlant:", forControlEvents: .TouchUpInside)
        
    }
    
    // Action
    
    func addPlant(sender: UIButton) {
        
    }
    
    func previousView(sender: UIButton) {
        self.performSegueWithIdentifier("backToAddPlantView", sender: self)
    }


}
