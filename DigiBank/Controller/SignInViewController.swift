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

class SignInViewController: UIViewController, signInViewControllerDelegate, UITextFieldDelegate {

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
    
    override func viewWillAppear(_ animated: Bool) {
        let username: String = UserDefaults.standard.object(forKey: Constants.storeString.userName) as? String ?? "nil"
        
        if username.count > 0 && username != "nil" {
            emailTextField.text = username
        }
    }
    //flag for image change on alert
    func showAlert(title: String, errorMessage: String, imageName: String) {
        
        self.popupAlert(title: title, message: errorMessage, actionTitles: [Constants.AlertMessage.btnOK], actions:[{action1 in
            DispatchQueue.main.async {
                self.moveToDashboard()
            }
            },{action2 in
            }, nil])
        
        //        self.alert(imageName: Constants.alertImages.checkImage, message: errorMessage, title: title)
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [unowned self] in
        //            self.moveToDashboard()
        //        }
    }
    
    func moveToDashboard() {
        
        let optionalBool: Bool? = UserDefaults.standard.bool(forKey: Constants.storeString.appLoginFlag)
        guard optionalBool == true else {
            return
        }
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "DashboardVc") as! DashboardViewController
//        vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- IBactions
    
    @IBAction func refresh(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "forgotVC") as! ForgotPasswordViewController
//        vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        viewModel.sendValue(from: emailTextField.text, password: passwordTextField.text)
        
    }
    
    @IBAction func backToSignInAction(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpViewController
//        vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- UITextfield
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
           return true
       }
    
}
