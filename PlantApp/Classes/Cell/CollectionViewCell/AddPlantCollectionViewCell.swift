//
//  AddPlantCollectionViewCell.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 16/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

class AddPlantCollectionViewCell: UICollectionViewCell {
 
    // MARK: - IBOutlet & Variable
    @IBOutlet weak var viewCell: UIView!
    
    static let cellIdentifier = "addCollectionViewCell"
    
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var plantName: UILabel!
    
    // MARK: - Awake
    
    override func awakeFromNib() {
        styleCell()
    }
    
    // MARK: - Style Cell
    
    func styleCell() {
        viewCell.layer.borderWidth = 2
        viewCell.layer.borderColor = UIColorFromRGBA("2F3043", alpha: 0.5).CGColor
        viewCell.layer.cornerRadius = 10
    }
    
    // MARK: - Parse data
    
    func parseData(data: Plants) {
        plantName.text = data.variety
        plantImage.image = UIImage(named: "\(data.variety)_happy")
    }
    
}
