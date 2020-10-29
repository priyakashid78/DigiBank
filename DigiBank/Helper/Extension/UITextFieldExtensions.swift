//
//  UIViewExtensions.swift
//  DigiBank
//
//  Created by priya.kashid on 21/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    
    func customTextfield() {
        
        //Basic texfield Setup
        
        self.backgroundColor = UIColor.white // Use anycolor that give you a 2d look.
        
        //To apply corner radius
        self.layer.cornerRadius = self.frame.size.height / 2
        
        //To apply border
        self.layer.borderWidth = 0.25
        self.layer.borderColor = UIColor.white.cgColor
        
        //To apply Shadow
       
        layer.shadowColor = AppColor.ShadowColor.TextFieldShadowColor?.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
        
        //To apply padding
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
        
    }
    
    func setButton (imageName: String)-> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        
        self.rightView = button
        self.rightViewMode = .always
        return button
    }
    
    
    
}
