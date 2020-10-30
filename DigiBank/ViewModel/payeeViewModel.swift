//
//  payeeViewModel.swift
//  DigiBank
//
//  Created by priya.kashid on 30/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol payeeViewModelDelegate {
    func sendValues(payeeName: String?,payeeNickName: String?, accNumber: String?, stateString: String?, cityString: String?, branchString: String?, mobileNumber: String?)
}

class payeeViewModel: payeeViewModelDelegate {
    
    
    var delegate: PayeeViewControllerDelegate?
    
    func sendValues(payeeName: String?, payeeNickName: String?, accNumber: String?, stateString: String?, cityString: String?, branchString: String?, mobileNumber: String?) {
        
        guard  payeeName!.count > 0 else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.ManagePayee.payeeNameValidationString, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard payeeNickName!.count > 0 else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.ManagePayee.nickNameValidationString, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard accNumber!.count == 16  else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.ManagePayee.accValidationString
                , imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard mobileNumber?.count == 10 else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.mobileAlert, imageName: Constants.alertImages.checkImage)
            return
        }
        
    
        delegate?.moveToNext()
        
    }
    
}
