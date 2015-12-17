//
//  SigninViewController.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 17/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit
import Parse

class SigninViewController: UIViewController, UITextFieldDelegate {

    // MARK: - IBOutle & Variable
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - View
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let backgroundColor = CAGradientLayer().mainGardient()
        backgroundColor.frame = self.view.bounds
        self.view.layer.insertSublayer(backgroundColor, atIndex: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.delegate = self
        userEmail.delegate = self
        userPassword.delegate = self
        styleView()
    }
    
    // MARK: - Style view
    
    func styleView() {
        self.navigationItem.title = "Sign in"
        userPassword.secureTextEntry = true
        customTextField(userName, placeholder: "Your sweet name")
        customTextField(userEmail, placeholder: "Your email")
        customTextField(userPassword, placeholder: "Your password")
        
        buttonUI()
    }
    
    func buttonUI() {
        customButton(signInButton, text: "Sign in now", color: "ffffff", borderColor: "", alpha: 1.0, borderWith: 2, cornerRadius: 10, target: self, action: "signIn:")
        signInButton.backgroundColor = UIColorFromRGBA("000000", alpha: 1.0)
        signInButton.titleLabel?.font = UIFont.systemFontOfSize(14)
    }
    
    // MARK: - Textfield delegate
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        animSelected(textField)
        textField.clearButtonMode = .WhileEditing
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        animDeSelected(textField)
        textFieldIsActive(textField, alpha: 1.0)
    }
    
    // Action
    
    func signIn(sender: UIButton) {

        let user = PFUser()
        user.username = userName.text
        user.email = userEmail.text
        user.password = userPassword.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? String
                showSimpleAlertWithTitle("Error", message: errorString!, viewController: self)
            } else {
                print("added")
            }
        }
        
    }


}
