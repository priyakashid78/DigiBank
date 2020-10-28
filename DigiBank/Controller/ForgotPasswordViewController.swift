//
//  ForgotPasswordViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 27/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol forgotPassDelegate {
    
    func showAlert(title: String, errorMessage: String, imageName: String)
}
class ForgotPasswordViewController: UIViewController,forgotPassDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    var viewModel = ForgotPassViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        emailTextField.customTextfield()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitAction(_sender: Any) {
        
        viewModel.sendValue(from: emailTextField.text)
    }
    //MARK:- Function
    @IBAction func backNavigation() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    func showAlert(title: String, errorMessage: String, imageName: String) {
        
        self.alert(imageName: Constants.alertImages.checkImage, message: errorMessage, title: title)
        if title == "Success" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [unowned self] in
                self.moveToSignIn()
            }
        }
    }
    
    func moveToSignIn() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
