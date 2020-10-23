//
//  SignInViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 21/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol signInViewControllerDelegate {
    
    func showAlert(title: String, errorMessage: String, imageName: String)
}

class SignInViewController: UIViewController, signInViewControllerDelegate {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    let viewModel = SignInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        emailTextField.customTextfield()
        passwordTextField.customTextfield()
        let mybuttin = passwordTextField.setButton(imageName:  Constants.loginImages.secureImage)
        mybuttin.addTarget(self, action: #selector(self.refresh), for: .touchUpInside)
        
    }
    //flag for image change on alert
    func showAlert(title: String, errorMessage: String, imageName: String) {
       
        self.alert(imageName: Constants.alertImages.checkImage, message: errorMessage, title: title)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [unowned self] in
            self.moveToDashboard()
        }
       
    }
    
    func moveToDashboard() {
        
        let optionalBool: Bool? = UserDefaults.standard.bool(forKey: Constants.storeString.appLoginFlag)
        guard optionalBool == true else {
            return
        }
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "DashboardVc") as! DashboardViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    //MARK:- IBactions
    
    @IBAction func refresh(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
    
    @IBAction func loginAction(_ sender: Any) {
        viewModel.sendValue(from: emailTextField.text, password: passwordTextField.text)
        
    }
    
    @IBAction func backToSignInAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}
