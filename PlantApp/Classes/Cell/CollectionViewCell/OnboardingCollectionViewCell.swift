//
//  OnboardingCollectionViewCell.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 15/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet & Variable
    
    @IBOutlet weak var onboardingTitle: UILabel!
    @IBOutlet weak var onboardingImage: UIImageView!
    @IBOutlet weak var onboardingText: UILabel!
    
    static  let cellIdentifier = "onboardingCollectionViewCell"
    
    // MARK: - Awake
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleCell()
    }
    
    // MARK: - Style Cell
    
    func styleCell() {
        onboardingTitle.textColor = UIColor.whiteColor()
        onboardingText.textColor = UIColor.whiteColor()
    }
    
    // MARK: - Parse data
    
    func parseData(data: AnyObject) {
        
        let title = data["title"] as! String
        let image = data["image"] as? String
        let textDetail = data["text"] as! String
        
        onboardingTitle.text = title.uppercaseString
        onboardingImage.image = UIImage(named: image!)
        onboardingText.text = textDetail
    
    }
    
    
    
    
}
