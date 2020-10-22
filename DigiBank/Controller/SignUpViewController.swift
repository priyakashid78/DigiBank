//
//  SignUpViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 22/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderButton: UIButton!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var occupationTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUI()
        self.setbutton()
        let passwordBt = passwordTextField.setButton(imageName: Constants.loginImages.secureImage)
        passwordBt.addTarget(self, action: #selector(self.showPassword), for: .touchUpInside)
        let confirmBt = confirmTextField.setButton(imageName:  Constants.loginImages.secureImage)
        confirmBt.addTarget(self, action: #selector(self.showConfirmPassword), for: .touchUpInside)
    }
    
    func setUI() {
        
        firstNameTextField.customTextfield()
        lastNameTextField.customTextfield()
        addressTextField.customTextfield()
        emailTextField.customTextfield()
        mobileTextField.customTextfield()
        occupationTextField.customTextfield()
        userTextField.customTextfield()
        passwordTextField.customTextfield()
        confirmTextField.customTextfield()
    }
    
    func setbutton() {
        genderButton.backgroundColor = UIColor.white // Use anycolor that give you a 2d look.
        
        //To apply corner radius
        genderButton.layer.cornerRadius = genderButton.frame.size.height / 2
        
        //To apply border
        genderButton.layer.borderWidth = 0.25
        genderButton.layer.borderColor = UIColor.white.cgColor
        
        //To apply Shadow
        genderButton.layer.shadowColor = AppColor.ShadowColor.TextFieldShadowColor?.cgColor
        genderButton.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        genderButton.layer.shadowOpacity = 0.2
        genderButton.layer.shadowRadius = 4.0
        
        genderButton.contentEdgeInsets = UIEdgeInsets(top: 5,left: 20,bottom: 5,right: 5)
        
        
    
    }
    //MARK:- IBAction
    
    @IBAction func showPassword(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @IBAction func showConfirmPassword(_ sender: Any) {
       confirmTextField.isSecureTextEntry.toggle()
    }
    
    @IBAction func openDropDown(_ sender: Any) {
       
    }
    
    //MARK:- PickerView Delegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    

}
