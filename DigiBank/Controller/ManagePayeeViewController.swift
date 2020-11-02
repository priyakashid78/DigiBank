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
    @IBOutlet weak var scrollView: UIScrollView!
    
    var flag:Int?
    
    var viewModel = payeeViewModel()
    
    var stateArray = [String]()
    var cityArray = [String]()
    var branchArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateArray = Constants.ManagePayee.stateArray
        cityArray = Constants.ManagePayee.cityArray
        branchArray = Constants.ManagePayee.branch1Array
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        singleTap.cancelsTouchesInView = false
        singleTap.numberOfTapsRequired = 1
        scrollView.addGestureRecognizer(singleTap)
        
        //For left Drawer
        viewModel.delegate = self
        self.setView()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: AppColor.accountOveriewSreenCode)
        //For left Drawer
        self.setNavigationBarItem()
        self.setRightBar()

        
    }
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        pickerView.isHidden = true
    }
    
    func moveToNext() {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "confirm3VC") as! ConfirmPayeeViewController
        vc.payeeNameString = self.payeeNameTextField.text
        vc.nickNameString = self.nickNameTextField.text
        vc.ifscString = self.IFSCTextField.text
        vc.paymentAccString = self.accNumberTextField.text
        vc.branchString =  self.branchButton.titleLabel?.text
        vc.mobileString = self.mobileNoTextField.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showAlert(title: String, errorMessage: String, imageName: String) {
        self.alert(imageName: Constants.alertImages.checkImage, message: errorMessage, title: title)
    }
    
    @IBAction func nextButtonAction() {
        
        viewModel.sendValues(payeeName: payeeNameTextField.text, payeeNickName: nickNameTextField.text, accNumber: accNumberTextField.text, stateString: stateButton.titleLabel?.text, cityString: cityButton.titleLabel?.text, branchString: branchButton.titleLabel?.text, mobileNumber: mobileNoTextField.text)
    }
    
    func setView() {
        
        IFSCTextField.text = Constants.ManagePayee.puneIFSC
        stateButton.setTitle(stateArray[0], for: .normal)
        cityButton.setTitle(cityArray[0], for: .normal)
        branchButton.setTitle(branchArray[0], for: .normal)
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
        self.view.endEditing(true)
        flag = 1
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
    }
    
    @IBAction func cityButtonAction() {
    
        self.view.endEditing(true)
        flag = 2
        if cityButton.titleLabel?.text == Constants.ManagePayee.cityArray[0] {
            branchButton.setTitle(Constants.ManagePayee.branch1Array[0], for: .normal)
             IFSCTextField.text = Constants.ManagePayee.puneIFSC
        } else {
            branchButton.setTitle(Constants.ManagePayee.branch2Array[0], for: .normal)
             IFSCTextField.text = Constants.ManagePayee.mumbaiIFSC
        }
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
        
    }
    
    @IBAction func branchButtonAction() {
        self.view.endEditing(true)
        flag = 3
        if cityButton.titleLabel?.text == Constants.ManagePayee.cityArray[0]  {
            branchArray = Constants.ManagePayee.branch1Array
             IFSCTextField.text = Constants.ManagePayee.puneIFSC
        } else {
            branchArray = Constants.ManagePayee.branch2Array
             IFSCTextField.text = Constants.ManagePayee.mumbaiIFSC
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
            
            if cityButton.titleLabel?.text == Constants.ManagePayee.cityArray[0] {
                IFSCTextField.text = Constants.ManagePayee.puneIFSC
                branchButton.setTitle(Constants.ManagePayee.branch1Array[0], for: .normal)
            } else {
                IFSCTextField.text = Constants.ManagePayee.mumbaiIFSC
                branchButton.setTitle(Constants.ManagePayee.branch2Array[0], for: .normal)
            }
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
