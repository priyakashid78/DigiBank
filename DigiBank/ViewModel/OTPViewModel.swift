//
//  OTPViewModel.swift
//  DigiBank
//
//  Created by priya.kashid on 29/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol OTPViewModelDelegate {
    
    func sendValue(userOTP: String?, generatorOTP: String?)
}

class OTPViewModel: OTPViewModelDelegate {
    
      var delegate: OTPViewControllerDelegate?
    
    func sendValue(userOTP: String?, generatorOTP: String?) {
        
        guard  userOTP == generatorOTP else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.otpValidation, imageName: Constants.alertImages.checkImage)
            return
        }
        delegate?.moveToNext()
    }
    
}
