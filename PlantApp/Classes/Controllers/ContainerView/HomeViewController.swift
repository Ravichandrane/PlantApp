//
//  HomeViewController.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 14/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: - IBOutlet & Variable

    @IBOutlet weak var plantCollectionView: UICollectionView!
    
    let cellIdentifier = "homeCollectionViewCell"
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plantCollectionView.dataSource = self
        plantCollectionView.delegate = self
        
        styleView()
        
    }
    
    // MARK: - Style view 
    
    func styleView() {
        plantCollectionView.backgroundColor = UIColor.clearColor()
        plantCollectionView.decelerationRate = UIScrollViewDecelerationRateFast
    }
    
    // MARK: - CollectionView DataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! HomeCollectionViewCell
        return cell
    }
    
    // MARK: - CollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
        
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
    
    

}
