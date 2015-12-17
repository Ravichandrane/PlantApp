//
//  AddPlantViewController.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 16/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

class AddPlantViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {

    // MARK: - IBOutle & Variable
    @IBOutlet weak var addPlantCollectionView: UICollectionView!
    
    // MARK: - Views
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.enabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPlantCollectionView.dataSource = self
        addPlantCollectionView.delegate = self
        addPlantCollectionView.backgroundColor = UIColor.clearColor()
        
        styleView()
    }
    
    // MARK: - Style view
    
    func styleView() {
        self.navigationItem.title = "Add a plant"
        navigationIcon("close", action: "dissmissView", target: self, navigationItem: navigationItem, position: "left")
    }
    
    // MARK: - CollectionView DataSource & Delegate
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 30, bottom: 10, right: 30)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.addPlantCollectionView.bounds.width / 2.5, height: 140)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(AddPlantCollectionViewCell.cellIdentifier, forIndexPath: indexPath) as! AddPlantCollectionViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let createView = storyboard?.instantiateViewControllerWithIdentifier("createPlant") as! CreatePlantViewController
        self.navigationController?.pushViewController(createView, animated: true)
    }
    
    
    // MARK: - Function
    
    func dissmissView() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Action
    
    // MARK: - Unwind
    
    @IBAction func backAddPlantView(unwindSegue: UIStoryboardSegue) {}


}