//
//  StringExtension.swift
//  DigiBank
//
//  Created by priya.kashid on 22/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import Foundation

extension String {
    
    func isValidEmail()->Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
