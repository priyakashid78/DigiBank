//
//  SignInViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 21/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.customTextfield()
        passwordTextField.customTextfield()
        let mybuttin = passwordTextField.setButton(imageName:  Constants.loginImages.secureImage)
        mybuttin.addTarget(self, action: #selector(self.refresh), for: .touchUpInside)
        
    }
    
    //MARK:- IBactions
    
    @IBAction func refresh(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
    
    @IBAction func loginAction(_ sender: Any) {
    }
    
    @IBAction func backToSignInAction(_ sender: Any) {
    }
    
}
