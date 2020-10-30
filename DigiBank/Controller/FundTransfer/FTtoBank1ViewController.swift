//
//  FTtoBank1ViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 29/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol FTSameViewCDelegate {
    
    func showAlert(title: String, errorMessage: String, imageName: String)
    func moveToNext()
}

class FTtoBank1ViewController: UIViewController,FTSameViewCDelegate, UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var remarkTextField: UITextField!
    @IBOutlet weak var fromAccButton: UIButton!
    @IBOutlet weak var toAccButton: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    var flag:Int?
    var fromAccountArray = [String]()
    let viewModel = FTSameModelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: AppColor.accountOveriewSreenCode)
        fromAccountArray = [Constants.FundTransfer.savingAcc,Constants.FundTransfer.savingAcc]
        
        
        //For left Drawer
        self.setNavigationBarItem()
        self.setRightBar()
        self.setView()
        // Do any additional setup after loading the view.
    }
    
    func setView() {
        
        pickerView.isHidden = true
        amountTextField.customTextfield()
        remarkTextField.customTextfield()
        dateTextField.customTextfield()
        dateTextField.text = Date().toString(dateFormat: "dd/MM/YYYY")
        toAccButton.customTextfield()
        fromAccButton.customButton(padding: true)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc func logoutNetBanking(sender: AnyObject){
        
    }
    
    @objc func languageChange(sender: AnyObject){
        
    }
    
    //MARK: Ibaction
    @IBAction func nextButton() {
        viewModel.sendValue(fromAcc: fromAccButton.titleLabel?.text
            , toacc: toAccButton.text, remarkText: remarkTextField.text, amount: amountTextField.text)
        
    }
    
    @IBAction func fromAccAction() {
        flag = 1
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
    }
    
    //MARK:- PickerView Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fromAccountArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fromAccountArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.isHidden=true
        fromAccButton.setTitle(fromAccountArray[row], for: .normal)
    }
    
    func showAlert(title: String, errorMessage: String, imageName: String) {
        self.alert(imageName: Constants.alertImages.checkImage, message: errorMessage, title: title)
    }
    
    func moveToNext() {
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "confirm1VC") as! Confirm1ViewController
        vc.fromAccountString = self.fromAccButton.titleLabel?.text
        vc.toAccountString = toAccButton.text
        vc.paymentModeString = Constants.FundTransfer.TransactionType
        vc.remarkString = self.remarkTextField.text
        vc.amountString =  self.amountTextField.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- UItextfield Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool
    {
        
        if textField == toAccButton {
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
