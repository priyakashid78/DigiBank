//
//  SignUpViewModel.swift
//  DigiBank
//
//  Created by priya.kashid on 23/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol signUpViewModelDelegate {
    func sendValue(firstN: String?, lastN: String?, email: String?,gender: String?, occupation: String?, password: String?, confirmPassword: String?, address: String?, username: String?, mobile: String?)
}

class SignUpViewModel: signUpViewModelDelegate {

    var delegate: signUpViewControllerDelegate?
    
    func sendValue(firstN: String?, lastN: String?, email: String?, gender: String?, occupation: String?, password: String?, confirmPassword: String?, address: String?, username: String?, mobile: String?){
        
        guard firstN!.count > 0 else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.firstNAlert, imageName: Constants.alertImages.checkImage)
            return
        }
        guard lastN!.count > 0 else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.lastNAlert, imageName: Constants.alertImages.checkImage)
            return
        }
        guard (email!.isValidEmail()) == true else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.emailAlert, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard (mobile!.count <= 10)  else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.mobileAlert, imageName: Constants.alertImages.checkImage)
            return
        }
       
        guard username!.count >= 3  else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.userNameAlert, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard password!.count >= 3  else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.passwordGreater, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard password != username else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.signUppasswordAlert, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard confirmPassword == password else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.validateString.confirmPassword, imageName: Constants.alertImages.checkImage)
            return
        }
        
        delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.alertString.successSignUp, imageName: Constants.alertImages.checkImage)
        
        UserDefaults.standard.set(username,  forKey: Constants.storeString.userName)
        
    }
    
    
}
