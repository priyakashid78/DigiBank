//
//  ForgotPassViewModel.swift
//  DigiBank
//
//  Created by priya.kashid on 27/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import Foundation
protocol forgotMVDelegate {
    func sendValue(from email: String?)
}

class ForgotPassViewModel: forgotMVDelegate {
   
    var delegate: forgotPassDelegate?
    
    func sendValue(from email: String?) {
        
        guard (email!.isValidEmail()) == true else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.emailAlert, imageName: Constants.alertImages.checkImage)
            return
        }
            
        delegate?.showAlert(title: Constants.alertString.success, errorMessage: Constants.alertString.forgotEmsil, imageName: Constants.alertImages.checkImage)
            
           
            
        }
        
    
}
