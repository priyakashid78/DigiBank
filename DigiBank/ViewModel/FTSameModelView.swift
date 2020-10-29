//
//  FTSameModelView.swift
//  DigiBank
//
//  Created by priya.kashid on 29/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol FTSameModelViewDelegate {
    func sendValue(fromAcc: String?, toacc: String?, remarkText: String?, amount: String?)
}

class FTSameModelView: FTSameModelViewDelegate {
    
    var delegate: FTSameViewCDelegate?
    
    func sendValue(fromAcc: String?, toacc: String?, remarkText: String?, amount: String?) {
        
    
        guard  fromAcc != "Select Account" else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.fromAccStringValidation, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard toacc?.count == 16  else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.toAccValidation, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard amount!.count > 0  else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.amountValidation, imageName: Constants.alertImages.checkImage)
            return
        }
    
        
        guard remarkText!.count > 0  else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.remarkValidation, imageName: Constants.alertImages.checkImage)
            return
        }
        
        delegate?.moveToNext()
    }
    
    
}

