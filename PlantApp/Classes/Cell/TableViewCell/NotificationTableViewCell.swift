//
//  NotificationTableViewCell.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 15/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    // MARK: IBOutlet & Variable
    
    @IBOutlet weak var notificationDate: UILabel!
    @IBOutlet weak var detailNotification: UILabel!

    // MARK: Awake
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleCell()
    }

    // MARK: Style cell
    
    func styleCell() {
        
        notificationDate.textColor = UIColorFromRGBA("C9C9C9", alpha: 1.0)
        notificationDate.text = "2 hours ago"
        
        detailNotification.textColor = UIColorFromRGBA("191919", alpha: 1.0)
        detailNotification.text = "Hey! You should water Paco more than usually. He must be thirsty. Be Careful :)"
        
    }

}
