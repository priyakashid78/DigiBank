//
//  ContactViewModel.swift
//  DigiBank
//
//  Created by priya.kashid on 23/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol contactViewModelDelegate {
    func sendValue(from email: String?, username: String?, comment: String?)
}

class ContactViewModel: contactViewModelDelegate {
    
    var delegate: contactViewControllerDelegate?
    
    func sendValue(from email: String?, username: String?, comment: String?) {
        guard username!.count > 0 else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.signInUserValidation, imageName: Constants.alertImages.checkImage)
            return
        }
        guard email!.count > 0 && email?.isValidEmail() == true else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.emailAlert, imageName: Constants.alertImages.checkImage)
            return
        }
        
        
        delegate?.moveToNextScreen()
        
    }
}
