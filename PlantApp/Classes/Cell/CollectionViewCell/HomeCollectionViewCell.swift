//
//  HomeCollectionViewCell.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 15/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet & Variable
    
    @IBOutlet weak var plantStatus: UIImageView!
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var information: UILabel!
    @IBOutlet weak var overlayView: UIView!
    
    
    // MARK: - Awake
    
    override func awakeFromNib() {
        
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
