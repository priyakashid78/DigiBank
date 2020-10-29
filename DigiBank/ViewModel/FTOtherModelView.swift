//
//  FTOtherModelView.swift
//  DigiBank
//
//  Created by priya.kashid on 28/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol FTOModelViewDelegate {
    func sendValue(paymentMode: String?, fromAcc: String?, toacc: String?, remarkText: String?, amount: String?)
}

class FTOtherModelView: FTOModelViewDelegate {
    
    var delegate: FtOtherDelegate?
    
    func sendValue(paymentMode: String?, fromAcc: String?, toacc: String?, remarkText: String?, amount: String?) {
        
    
        guard  fromAcc != "Select Account" else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.fromAccStringValidation, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard toacc != "Select One" else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.fromAccStringValidation, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard amount!.count > 0  else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.amountValidation, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard paymentMode != "Payment Type" else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.paymentValidation, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard remarkText!.count > 0  else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.remarkValidation, imageName: Constants.alertImages.checkImage)
            return
        }
        
        delegate?.moveToNext()
    }
    
    
}
