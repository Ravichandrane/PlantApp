//
//  PasswordForgotViewController.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 17/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit
import Parse

class PasswordForgotViewController: UIViewController, UITextFieldDelegate {

    // MARK: - IBOutle & Variable

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetPassword: UIButton!
    
    // MARK: - View
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let backgroundColor = CAGradientLayer().mainGardient()
        backgroundColor.frame = self.view.bounds
        self.view.layer.insertSublayer(backgroundColor, atIndex: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        styleView()
    }
    
    // MARK: - Style view
    
    func styleView() {
        self.navigationItem.title = "Forgot password"
        customTextField(emailTextField, placeholder: "Email")
        customButton(resetPassword, text: "Login now", color: "ffffff", borderColor: "", alpha: 1.0, borderWith: 2, cornerRadius: 10, target: self, action: "reset:")
        resetPassword.backgroundColor = UIColorFromRGBA("000000", alpha: 1.0)
        resetPassword.titleLabel?.font = UIFont.systemFontOfSize(14)
    }
    
    // MARK: - Textfield delegate
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        animSelected(textField)
        moveUp(self.resetPassword, view: nil, y: -190)
        textField.clearButtonMode = .WhileEditing
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        animDeSelected(textField)
        moveUp(self.resetPassword, view: nil, y: 0)
        textFieldIsActive(textField, alpha: 1.0)
    }
    
    // MARK: - Action
    
    func reset(sender: UIButton) {
        
        let emailAdress = emailTextField.text
        
        if emailAdress!.isEmpty {
            showSimpleAlertWithTitle("Email input empty", message: "Please fill your email adress", viewController: self)
            return
        }else{
            PFUser.requestPasswordResetForEmailInBackground(emailAdress!, block: { (success: Bool, error: NSError?) -> Void in
                if success {
                    self.emailTextField.text = ""
                    showSimpleAlertWithTitle("Email sent", message: "An email was sent to you \(emailAdress!)", viewController: self)
                }else{
                    showSimpleAlertWithTitle("Oups something wrong", message: "\(error)", viewController: self)
                }
            })
        }
        
        
    }

}
