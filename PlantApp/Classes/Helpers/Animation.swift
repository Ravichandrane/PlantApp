//
//  Animation.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 17/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

func animSelected(textField: UITextField) {
    UIView.animateWithDuration(0.5) { () -> Void in
        textField.alpha = 1.0
    }
}

func animDeSelected(textField: UITextField) {
    UIView.animateWithDuration(0.5) { () -> Void in
        textField.alpha = 0.7
    }
}

func moveUp(button: UIButton?, view: UIView?, y: CGFloat) {
    
    UIView.animateWithDuration(
        0.7,
        delay: 0,
        usingSpringWithDamping: 0.7,
        initialSpringVelocity: 0.7, options: [],
        animations: { () -> Void in
            if button == nil {
                view!.transform = CGAffineTransformMakeTranslation(0, y)
            }else{
                button!.transform = CGAffineTransformMakeTranslation(0, y)
            }
        }, completion: nil);
    
}