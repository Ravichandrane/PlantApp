//
//  OnboardingViewController.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 15/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: - IBOutle & Variable
    
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    var onboardingViewData: [[String:AnyObject]] = []
    
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        startButton.alpha = 0;
        startButton.enabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingCollectionView.backgroundColor = UIColor.clearColor()
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.delegate = self
        onboardingCollectionView.showsHorizontalScrollIndicator = false
        onboardingCollectionView.pagingEnabled = true
        onboardingCollectionView.bounces = false
        onboardingViewData = onboardingData
        
        styleView()
    }
    
    // MARK: - Style View
    
    func styleView() {
        
        pageControl.numberOfPages = onboardingViewData.count
        pageControl.pageIndicatorTintColor = UIColorFromRGBA("2F3043", alpha: 0.5)
        startButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        startButton.titleLabel?.textColor = UIColorFromRGBA("2F3043", alpha: 1.0)
        startButton.setAttributedTitle(NSAttributedString(string: "Lets go!".uppercaseString), forState: UIControlState.Normal)
        startButton.addTarget(self, action: "startAdventure:", forControlEvents: .TouchUpInside)
        
    }
    
    // MARK: - ScrollView Delegate
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageWidth = CGRectGetWidth(scrollView.frame)
        let currentPage = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        
        pageControl.currentPage = Int(currentPage)
        
        if currentPage == 3 {
            hideStartButton(1.0, enabled: true)
        }else{
            hideStartButton(0, enabled: false)
        }
        
    }
    
    // MARK: - CollectionView DataSource & Delegate
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingViewData.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(OnboardingCollectionViewCell.cellIdentifier, forIndexPath: indexPath) as! OnboardingCollectionViewCell
        let data = onboardingViewData[indexPath.row]
        cell.parseData(data)
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    // MARK: - Fonction
    
    func hideStartButton(alpha: CGFloat, enabled: Bool) {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.startButton.alpha = alpha
            self.startButton.enabled = enabled
        }
    }
    
    // MARK: - Action
    
    func startAdventure(sender: UIButton) {
        
        let loginViewControllerView = storyboard?.instantiateViewControllerWithIdentifier("loginViewNav")
        self.presentViewController(loginViewControllerView!, animated: true, completion: nil)
        
        LocalStore.isFirstTime(true)
        
    }
    

}
