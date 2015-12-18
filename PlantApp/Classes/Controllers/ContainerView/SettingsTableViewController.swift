//
//  SettingsTableViewController.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 17/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit
import Parse

class SettingsTableViewController: UITableViewController {
    
    // MARK: - IBOutlet & Variable
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    let currentUser = PFUser.currentUser()
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    // MARK: - TableView Delegate
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.selectionStyle = .None
    }
    
    // MARK: - Style view
    
    func styleView() {
        userName.text = "\(currentUser!.objectForKey("username")!)"
        userEmail.text = "\(currentUser!.objectForKey("email")!)"
        customButton(logOutButton, text: "Log out \(currentUser!.objectForKey("username")!)", color: "D53A47", borderColor: "", alpha: 1.0, borderWith: 0, cornerRadius: 0, target: self, action: "logOut:")
        logOutButton.titleLabel?.font = UIFont.systemFontOfSize(14)
    }
    
    // MARK: - Action
    
    func logOut(sender: UIButton) {
        PFUser.logOut()
        let loginViewNav  = self.storyboard?.instantiateViewControllerWithIdentifier("loginView") as! LoginViewController
        loginViewNav.modalTransitionStyle = .FlipHorizontal
        let navigationController = UINavigationController(rootViewController: loginViewNav)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
}
