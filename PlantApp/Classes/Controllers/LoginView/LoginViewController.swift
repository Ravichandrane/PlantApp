//
//  LoginViewController.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 17/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: - IBOutle & Variable
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccount: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    
    // MARK: - View
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let backgroundColor = CAGradientLayer().mainGardient()
        backgroundColor.frame = self.view.bounds
        self.view.layer.insertSublayer(backgroundColor, atIndex: 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackOpaque
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.view.backgroundColor = UIColor.clearColor()
        self.navigationController!.navigationBar.translucent = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        styleView()
    }
    
    // MARK: - Style view
    
    func styleView() {
        self.navigationItem.title = "Login"
        passwordTextField.secureTextEntry = true
        customTextField(emailTextField, placeholder: "Username")
        customTextField(passwordTextField, placeholder: "Password")
        buttonUI()
    }
    
    func buttonUI() {
        
        customButton(createAccount, text: "Sign up now", color: "000000", borderColor: "", alpha: 1.0, borderWith: 0, cornerRadius: 0, target: self, action: "signUp:")
        createAccount.titleLabel?.font = UIFont.systemFontOfSize(14)
        
        customButton(forgotPassword, text: "Forgot password ?", color: "000000", borderColor: "", alpha: 1.0, borderWith: 0, cornerRadius: 0, target: self, action: "forgotPassword:")
        forgotPassword.titleLabel?.font = UIFont.systemFontOfSize(14)
        
        customButton(loginButton, text: "Login now", color: "ffffff", borderColor: "", alpha: 1.0, borderWith: 2, cornerRadius: 10, target: self, action: "login:")
        loginButton.backgroundColor = UIColorFromRGBA("000000", alpha: 1.0)
        loginButton.titleLabel?.font = UIFont.systemFontOfSize(14)
        
    }
    
    // MARK: - Textfield delegate
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        animSelected(textField)
        moveUp(self.loginButton, view: nil, y: -190)
        textField.clearButtonMode = .WhileEditing
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        animDeSelected(textField)
        moveUp(self.loginButton, view: nil, y: 0)
        textFieldIsActive(textField, alpha: 1.0)
    }
    
    // MARK: - Action
    
    func login(sender: UIButton) {
        PFUser.logInWithUsernameInBackground(emailTextField.text!, password : passwordTextField.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                let homeViewNav  = self.storyboard?.instantiateViewControllerWithIdentifier("mainView") as! ViewController
                homeViewNav.modalTransitionStyle = .FlipHorizontal
                let navigationController = UINavigationController(rootViewController: homeViewNav)
                self.presentViewController(navigationController, animated: true, completion: nil)
            } else {
                showSimpleAlertWithTitle("MyGarden", message: "Oups something wrong !", viewController: self)
            }
        }
    }
    
    func signUp(sender: UIButton) {
        let signInView = self.storyboard?.instantiateViewControllerWithIdentifier("signUpView")
        self.navigationController?.pushViewController(signInView!, animated: true)
    }
    
    func forgotPassword(sender: UIButton) {
        let forgotPasswordView = self.storyboard?.instantiateViewControllerWithIdentifier("passwordForgotView")
        self.navigationController?.pushViewController(forgotPasswordView!, animated: true)
    }

    // MARK: - Unwind
    
    @IBAction func backLoginView(unwindSegue: UIStoryboardSegue) {}
    
}
