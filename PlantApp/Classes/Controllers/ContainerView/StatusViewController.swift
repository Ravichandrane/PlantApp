//
//  StatusViewController.swift
//  PlantApp
//
//  Created by Ravichandrane Rajendran on 14/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit
import Parse

class StatusViewController: UIViewController {

    // MARK: - IBOutlet & Variable
    
    @IBOutlet var percentCircle: UILabel!
    @IBOutlet var circleProgress: CircleProgressView!
    @IBOutlet weak var informationBar: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var toWater: UIView!
    @IBOutlet weak var infoText: UILabel!
    @IBOutlet var plantName: UILabel!
    
    var plant:UserPlants?
    var plantParse:PFObject?
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
        
        let query = PFQuery(className:"Have")
        query.getObjectInBackgroundWithId((plant?.id)!) {
            (plant: PFObject?, error: NSError?) -> Void in
            if error == nil && plant != nil {
                self.plantParse = plant
                if let data = plant!.objectForKey("humidity"){
                    if let humidity:Double = Double(data as! NSNumber){
                        if humidity > 0{
                            self.circleProgress.progress = Double(plant!.objectForKey("humidity") as! NSNumber)/100
                            self.percentCircle.text = "\(Double(plant!.objectForKey("humidity")! as! NSNumber))%"
                            
                        }
                    }
                }
                
            }
        }
    }
    
    // MARK: - Style view
    
    func styleView() {
        self.navigationItem.title = "Plant info"
        infoText.text = "To water".uppercaseString
        navigationIcon("BackBtn", action: "previousView:", target: self, navigationItem: navigationItem, position: "left")
        ShadowView(informationBar)
        
        toWater.layer.cornerRadius = toWater.frame.width / 2
        toWater.clipsToBounds = true
        
        plantName.text = plant?.plantName
        
        circleProgress.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
    }
    
    // MARK: - Action
    @IBAction func toWaterAction(sender: UITapGestureRecognizer) {
        if(circleProgress.progress >= 1){
            circleProgress.progress = 0.10
            percentCircle.text = "0%"
        }else{
            dispatch_async(dispatch_get_main_queue()) {
                self.circleProgress.setProgress(self.circleProgress.progress + 0.1, animated:true)
                };
            percentCircle.text = "\(circleProgress.progress*100+10)%"
            self.plantParse?["humidity"] = circleProgress.progress*100+10
            self.plantParse?.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    print("Saved")
                } else {
                    print("Error")
                }
            }
        }
    }
    
    func previousView(sender: UIButton) {
        self.performSegueWithIdentifier("backToView", sender: self)
    }

}
