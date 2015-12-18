//
//  HomeCollectionViewCell.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 15/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit
import Parse

class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet & Variable
    
    @IBOutlet weak var plantStatus: UIImageView!
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var information: UILabel!
    @IBOutlet weak var overlayView: UIView!
    
    static let cellIdentifier = "homeCollectionViewCell"
    
    // MARK: - Parse data
    
    func parseData(data: UserPlants) {
        
        let plant = data.plant.query()
        
        plantName.text = data.plantName
        
        plant.findObjectsInBackgroundWithBlock { (object:[PFObject]?, error:NSError?) -> Void in
            if let name = object![0]["variety"]{
                let plantName = name as? String
                self.information.text = plantName
                self.plantStatus.image = UIImage(named: "\(plantName!)_happy")
            }
        }
        
    }
    
    // MARK: - Init scroll effect
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        
        let standardHeight = HomeLayoutConstants.Cell.standardHeight
        let featuredHeight = HomeLayoutConstants.Cell.featuredHeight
        
        let delta = 1 - ((featuredHeight - CGRectGetHeight(frame)) / (featuredHeight - standardHeight))
        
        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.85
        let scale = max(delta, 0.5)
        
        overlayView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        plantName.transform = CGAffineTransformMakeScale(scale, scale)
        information.transform = CGAffineTransformMakeScale(scale, scale)
    
    }
    
}
