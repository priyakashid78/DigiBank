//
//  URNViewModel.swift
//  DigiBank
//
//  Created by priya.kashid on 02/11/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import Foundation

protocol URNViewModelDelegate {
    
    func sendValue(userURN: String?, generatorURN: String?)
}

class URNViewModel: URNViewModelDelegate {
    
      var delegate: URNControllerDelegate?
    
    func sendValue(userURN: String?, generatorURN: String?) {
        
        guard  userURN == generatorURN else {
            
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.otpValidation, imageName: Constants.alertImages.checkImage)
            return
        }
        
        delegate?.moveToNext()
    }
    
}
