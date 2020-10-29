//
//  StringExtension.swift
//  DigiBank
//
//  Created by priya.kashid on 22/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

extension String {
    
    func isValidEmail()->Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 10
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func countOnlyForTenDigit()->Bool {
       
        return self.count <= 10
    }
    
    func withBoldText(text1: String,text2: String) -> NSAttributedString {

        
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont(name: FontConstants.Poppins_Bold, size: 18.0)!
        ]
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont(name: FontConstants.Poppins_Medium, size: 18.0)!
        ]
        let boldText = NSAttributedString(string: text1, attributes: boldAttribute)
        let regularText = NSAttributedString(string: text2, attributes: regularAttribute)
        let newString = NSMutableAttributedString()
        newString.append(boldText)
        newString.append(regularText)
        return newString
    }
}
