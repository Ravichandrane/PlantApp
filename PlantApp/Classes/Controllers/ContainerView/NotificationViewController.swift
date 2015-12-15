//
//  NotificationViewController.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 14/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutle & Variable
    
    @IBOutlet weak var notificationTableView: UITableView!
    let cellIdentifier = "notificationTableViewCell"

    // MARK: - View
    
    override func viewWillAppear(animated: Bool) {
        notificationTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    // MARK: - Style view
    
    func styleView() {
        notificationTableView.rowHeight = UITableViewAutomaticDimension
        notificationTableView.estimatedRowHeight = 44.0
        notificationTableView.backgroundColor = UIColorFromRGBA("EFEFEF", alpha: 1.0)
        notificationTableView.separatorColor = UIColorFromRGBA("DFDFDF", alpha: 1.0)
    }

    // MARK: - TableView DataSource & Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! NotificationTableViewCell
        
        cell.selectionStyle = .None
        cell.backgroundColor = UIColor.clearColor()
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        
        return cell
    }
    

}
