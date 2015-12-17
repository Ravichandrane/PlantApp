//
//  CustomTextField.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 17/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import UIKit

func customTextField(textField: UITextField, placeholder: String) {
    
    textField.autocorrectionType = .No
    textField.keyboardAppearance = UIKeyboardAppearance.Dark
    textField.alpha = 0.7
    textField.backgroundColor = UIColor.clearColor()
    textField.layer.borderWidth = 2
    textField.layer.borderColor = UIColorFromRGBA("FFFFFFF", alpha: 1.0).CGColor
    textField.layer.cornerRadius = 10
    textField.tintColor = UIColorFromRGBA("FFFFFFF", alpha: 1.0)
    
    textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSForegroundColorAttributeName: UIColorFromRGBA("FFFFFFF", alpha: 1.0)])
    textField.textColor = UIColorFromRGBA("FFFFFFF", alpha: 1.0)
    textField.leftView = UIView(frame: CGRectMake(0, 0, 15, textField.bounds.size.height))
    textField.leftViewMode = UITextFieldViewMode.Always
    
}

func textFieldIsActive(textField: UITextField, alpha: CGFloat) {
    if textField.text!.isEmpty {
        animDeSelected(textField)
    }else{
        textField.alpha = alpha
    }
}