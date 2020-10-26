//
//  UIButtonExtension.swift
//  DigiBank
//
//  Created by priya.kashid on 22/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

extension UIButton {
    
    
    func customButton(padding: Bool) {
        
       // Use anycolor that give you a 2d look.
        //To apply corner radius
        self.layer.cornerRadius = self.frame.size.height / 2
        
        //To apply border
        self.layer.borderWidth = 0.25
        self.layer.borderColor = UIColor.white.cgColor
        
        //To apply Shadow
        self.layer.shadowColor = AppColor.ShadowColor.TextFieldShadowColor?.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4.0
        
        if padding {
            self.contentEdgeInsets = UIEdgeInsets(top: 5,left: 20,bottom: 5,right: 5)
        }
        
    }
}
