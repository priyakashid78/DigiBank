//
//  SignUpViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 22/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol signUpViewControllerDelegate {
    
    func showAlert(title: String, errorMessage: String, imageName: String)
}
class SignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, signUpViewControllerDelegate {
    
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
    @IBOutlet weak var pickerView: UIPickerView!
    var pickerData =  [String]()
    var viewModel = SignUpViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = ["Male", "Female", "Other"]
        self.setUI()
        viewModel.delegate = self
    }
    
    func setUI() {
        
        pickerView.isHidden = true
        genderButton.setTitle(pickerData[0], for: .normal)
        genderButton.customButton(padding: true)
        let passwordBt = passwordTextField.setButton(imageName: Constants.loginImages.secureImage)
        passwordBt.addTarget(self, action: #selector(self.showPassword), for: .touchUpInside)
        let confirmBt = confirmTextField.setButton(imageName:  Constants.loginImages.secureImage)
        confirmBt.addTarget(self, action: #selector(self.showConfirmPassword), for: .touchUpInside)
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
    
    @IBAction func backAction(_ sender: Any) {
        self.backNavigation()
    }
    
    @IBAction func backToSignIn(_ sender: Any) {
        self.backNavigation()
    }
    
    @IBAction func openDropDown(_ sender: Any) {
        pickerView.isHidden = false
    }
    
    @IBAction func submitAction(_sender: Any) {
        
        viewModel.sendValue(firstN: firstNameTextField.text, lastN: lastNameTextField.text, email: emailTextField.text,gender: genderButton.titleLabel?.text, occupation: occupationTextField.text, password: passwordTextField.text, confirmPassword: confirmTextField.text, address: addressTextField.text, username: userTextField.text, mobile: mobileTextField.text)
    }
    //MARK:- Function
    func backNavigation() {
       // self.dismiss(animated: true, completion: nil)
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    func showAlert(title: String, errorMessage: String, imageName: String) {
        
        self.alert(imageName: Constants.alertImages.checkImage, message: errorMessage, title: title)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [unowned self] in
            self.moveToLogin()
        }
    }
    
    func moveToLogin() {
        let isUserName: String? = UserDefaults.standard.object(forKey: Constants.storeString.userName) as? String
        
        guard isUserName != nil else {
            return
        }
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
//        vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- PickerView Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderButton.setTitle(pickerData[row], for: .normal)
        pickerView.isHidden = true
    }
    
    //MARK:- UItextfield Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool
    {
        if textField == firstNameTextField || textField == lastNameTextField {
            
            let regex = try! NSRegularExpression(pattern: "[a-zA-Z\\s]+", options: [])
            let range = regex.rangeOfFirstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count))
            return range.length == string.count
        }
        
        if textField == mobileTextField {
            let charsLimit = 10
            
            let startingLength = textField.text?.count ?? 0
            let lengthToAdd = string.count
            let lengthToReplace =  range.length
            let newLength = startingLength + lengthToAdd - lengthToReplace
            
            return newLength <= charsLimit
        }
        return true
    }
    
    
    
}
