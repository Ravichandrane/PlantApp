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
    @IBOutlet weak var currentPosition: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    // MARK: - View
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        getWeather()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plantCollectionView.dataSource = self
        plantCollectionView.delegate = self
        styleView()
    
    }
    
    // MARK: - Style View
    
    func styleView() {
        plantCollectionView.backgroundColor = UIColor.clearColor()
        plantCollectionView.decelerationRate = UIScrollViewDecelerationRateFast
    }
    
    // MARK: - Weather Information
    
    func getWeather() {
        POService.getCurrentWeather(49.035723, userLongitude: 2.478652) { (response, error) -> () in
            if error != nil {
                print("error")
            }else{
                if response != nil {
                    self.windSpeed.text = "\(response!.windSpeed) km/h"
                    self.humidity.text = "\(response!.humidity * 100) %"
                    self.temperature.text = "\(response!.temperature)°"
                }
            }
        }
    }
    
    // MARK: - CollectionView DataSource & Delegate
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HomeCollectionViewCell.cellIdentifier, forIndexPath: indexPath) as! HomeCollectionViewCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let statusViewController = storyboard?.instantiateViewControllerWithIdentifier("statusView") as! StatusViewController
        self.navigationController?.pushViewController(statusViewController, animated: true)
    }
    

}
