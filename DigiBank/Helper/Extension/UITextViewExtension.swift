//
//  UITextViewExtension.swift
//  DigiBank
//
//  Created by priya.kashid on 21/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

extension UITextView{

    func setPlaceholder() {

        let placeholderLabel = UILabel()
        placeholderLabel.text = "Comment"
        placeholderLabel.font = UIFont.init(name: FontConstants.Poppins_Regular, size: 10)//italicSystemFont(ofSize: (self.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        placeholderLabel.tag = 222
        placeholderLabel.frame.origin = CGPoint(x: 20, y: (self.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !self.text.isEmpty

        self.addSubview(placeholderLabel)
    }

    func checkPlaceholder() {
        let placeholderLabel = self.viewWithTag(222) as! UILabel
        placeholderLabel.isHidden = !self.text.isEmpty
    }
    
    func leftSpace() {
        self.textContainerInset = UIEdgeInsets(top: 10, left: 20, bottom: 4, right: 4)
    }

}
