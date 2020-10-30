//
//  ManagePayeeViewController.swift
//  DigiBank
//
//  Created by baban.jadhav on 27/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol PayeeViewControllerDelegate {
    
    func showAlert(title: String, errorMessage: String, imageName: String)
    func moveToNext()
}

class ManagePayeeViewController: UIViewController, PayeeViewControllerDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var payeeNameTextField: UITextField!
    @IBOutlet weak var IFSCTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var mobileNoTextField: UITextField!
    @IBOutlet weak var accNumberTextField: UITextField!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var branchButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var flag:Int?
    
    var viewModel = payeeViewModel()
    
    var stateArray = [String]()
    var cityArray = [String]()
    var branchArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateArray = Constants.ManagePayee.stateArray
        cityArray = Constants.ManagePayee.cityArray
        
        
        //For left Drawer
        viewModel.delegate = self
        self.setNavigationBarItem()
        self.setRightBar()
        self.setView()
    }
    
    
    func moveToNext() {
        
    }
    
    func showAlert(title: String, errorMessage: String, imageName: String) {
        self.alert(imageName: Constants.alertImages.checkImage, message: errorMessage, title: title)
    }
    
    @IBAction func nextButtonAction() {
        
        viewModel.sendValues(payeeName: payeeNameTextField.text, payeeNickName: nickNameTextField.text, accNumber: accNumberTextField.text, stateString: stateButton.titleLabel?.text, cityString: cityButton.titleLabel?.text, branchString: branchButton.titleLabel?.text, mobileNumber: mobileNoTextField.text)
    }
    
    func setView() {
        
        pickerView.isHidden = true
        payeeNameTextField.customTextfield()
        accNumberTextField.customTextfield()
        nickNameTextField.customTextfield()
        mobileNoTextField.customTextfield()
        IFSCTextField.customTextfield()
        stateButton.customButton(padding: true)
        cityButton.customButton(padding: true)
        branchButton.customButton(padding: true)
        
    }
    
    func setRightBar() {
        
        let logout = UIBarButtonItem(image: UIImage(named: Constants.navigationbarImage.logoutBlue), style: .plain, target: self, action: #selector(self.logoutNetBanking(sender:)))
        let userImage = UIBarButtonItem(image: UIImage(named: Constants.navigationbarImage.userImage),  style: .plain, target: self, action: nil)
        let language = UIBarButtonItem(image: UIImage(named: Constants.navigationbarImage.languageBlue),  style: .plain, target: self, action: #selector(self.languageChange(sender:)))
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        navigationController?.navigationBar.tintColor = AppColor.appPrimaryColorDark
        navigationItem.rightBarButtonItems = [logout,userImage,language]
    }
    
    @objc func logoutNetBanking(sender: AnyObject){
        
    }
    
    @objc func languageChange(sender: AnyObject){
        
    }
    

    @IBAction func stateButtonAction() {
        flag = 1
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
    }
    
    @IBAction func cityButtonAction() {
        flag = 2
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
        
    }
    
    @IBAction func branchButtonAction() {
        flag = 3
        if cityButton.titleLabel?.text == "Pune" {
            branchArray = Constants.ManagePayee.branch1Array
        } else {
             branchArray = Constants.ManagePayee.branch2Array
        }
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
    }
    
    //MARK:- PickerView Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if flag == 1 {
            return stateArray.count
        } else if flag == 2 {
            return cityArray.count
        } else {
            return branchArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if flag == 1 {
            return stateArray[row]
        } else if flag == 2 {
            return cityArray[row]
        } else {
            return branchArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.isHidden=true
        if flag == 1 {
            stateButton.setTitle(stateArray[row], for: .normal)
        } else if flag == 2 {
            cityButton.setTitle(cityArray[row], for: .normal)
        } else {
            branchButton.setTitle(branchArray[row], for: .normal)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool
       {
           if textField == payeeNameTextField  {
               
               let regex = try! NSRegularExpression(pattern: "[a-zA-Z\\s]+", options: [])
               let range = regex.rangeOfFirstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count))
               return range.length == string.count
           }
           
           if textField == mobileNoTextField {
               let charsLimit = 10
               
               let startingLength = textField.text?.count ?? 0
               let lengthToAdd = string.count
               let lengthToReplace =  range.length
               let newLength = startingLength + lengthToAdd - lengthToReplace
               
               return newLength <= charsLimit
           }
        
        if textField == accNumberTextField {
            let charsLimit = 16
            
            let startingLength = textField.text?.count ?? 0
            let lengthToAdd = string.count
            let lengthToReplace =  range.length
            let newLength = startingLength + lengthToAdd - lengthToReplace
            
            return newLength <= charsLimit
        }
        return true
    }
    
}
