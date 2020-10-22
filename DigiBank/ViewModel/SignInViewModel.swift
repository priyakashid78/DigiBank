//
//  SignInViewModel.swift
//  DigiBank
//
//  Created by priya.kashid on 22/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import Foundation

protocol signInViewModelDelegate {
    func sendValue(from email: String?, password: String?)
}

class SignInViewModel: signInViewModelDelegate {
    
    var delegate: signInViewControllerDelegate?
    
    func sendValue(from email: String?, password: String?) {
       
        guard (email?.isValidEmail()) == true else {
            delegate?.showAlert(title: "hi", errorMessage: Constants.alertString.emailAlert, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard password!.count > 0 else {
            delegate?.showAlert(title: "hii", errorMessage: Constants.alertString.passwordAlert, imageName: Constants.alertImages.checkImage)
            return
        }
        delegate?.showAlert(title: "hi", errorMessage: Constants.alertString.successLogin, imageName: Constants.alertImages.checkImage)
        print("12")
        UserDefaults.standard.set(true, forKey: Constants.storeString.appLoginFlag)
        
    }
    
   
}
