//
//  FTOtherBankViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 28/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol FtOtherDelegate {
    
    func showAlert(title: String, errorMessage: String, imageName: String)
    func moveToNext()
}
class FTOtherBankViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,FtOtherDelegate, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var neftButton: UIButton!
    @IBOutlet weak var rtgsButton: UIButton!
    @IBOutlet weak var impsButton: UIButton!
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var remarkTextField: UITextField!
    @IBOutlet weak var fromAccButton: UIButton!
    @IBOutlet weak var toAccButton: UITextField!
    @IBOutlet weak var paymentTypeButton: UIButton!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    var flag:Int?
    var fromAccountArray = [String]()
    var toAccountArray = [String]()
    var paymentTypeArray = [String]()
    let viewModel = FTOtherModelView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel.delegate = self
      
      
        fromAccountArray = [Constants.FundTransfer.savingAcc,Constants.FundTransfer.savingAcc]
        paymentTypeArray = [Constants.FundTransfer.paymentTypeOneTime,Constants.FundTransfer.paymentTypeRe]
        toAccountArray =  UserDefaults.standard.stringArray(forKey: Constants.storeString.payeeArray) ?? [String]()
        
        //For left Drawer
        self.setNavigationBarItem()
        self.setRightBar()
        self.setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //For left Drawer
        self.setNavigationBarItem()
       self.navigationController?.navigationBar.isHidden = false
    }
    
    func setView() {
        
        pickerView.isHidden = true
        amountTextField.customTextfield()
        remarkTextField.customTextfield()
        dateTextField.customTextfield()
        dateTextField.text = Date().toString(dateFormat: "dd/MM/YYYY")
        toAccButton.customTextfield()
        fromAccButton.customButton(padding: true)
        paymentTypeButton.customButton(padding: true)
        impsButton.setBorderCornerRadius()
        rtgsButton.setBorderCornerRadius()
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()

        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
       // textField.inputAccessoryView = toolBar
    }
    @objc func doneClick() {
   //   txt_pickUpData.resignFirstResponder()
     }
    @objc func cancelClick() {
   //   txt_pickUpData.resignFirstResponder()
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
    
    //MARK: Ibaction
    @IBAction func nextButton() {
        viewModel.sendValue(paymentMode: paymentTypeButton.titleLabel?.text, fromAcc: fromAccButton.titleLabel?.text
            , toacc: toAccButton.text, remarkText: remarkTextField.text, amount: amountTextField.text)
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == toAccButton && toAccountArray.count > 0{
            flag = 2
            self.view.endEditing(true)
            pickerView.reloadAllComponents()
             pickerView.isHidden = false
        }
        return false
    }
    
    
    @IBAction func fromAccAction() {
        flag = 1
        self.view.endEditing(true)
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
    }
    
    @IBAction func toAccAction() {
        flag = 2
        self.view.endEditing(true)
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
        
    }
    
    @IBAction func paymentAction() {
        flag = 3
        self.view.endEditing(true)
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
    }
    
    //MARK:- PickerView Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if flag == 1 {
            return fromAccountArray.count
        } else if flag == 2 {
            return toAccountArray.count
        } else {
            return paymentTypeArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if flag == 1 {
            return fromAccountArray[row]
        } else if flag == 2 {
            return toAccountArray[row]
        } else {
            return paymentTypeArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.isHidden=true
        if flag == 1 {
            fromAccButton.setTitle(fromAccountArray[row], for: .normal)
        } else if flag == 2 {
            toAccButton.text = toAccountArray[row]//setTitle(toAccountArray[row], for: .normal)
        } else {
            paymentTypeButton.setTitle(paymentTypeArray[row], for: .normal)
        }
    }
    
    func showAlert(title: String, errorMessage: String, imageName: String) {
         self.alert(imageName: Constants.alertImages.checkImage, message: errorMessage, title: title)
    }
    
    func moveToNext() {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "confirm2VC") as! Confirm2ViewController
        vc.fromAccountString = self.fromAccButton.titleLabel?.text
        vc.toAccountString = self.toAccButton.text
        vc.paymentModeString = "NEFT"
        vc.remarkString = self.remarkTextField.text
        vc.amountString =  self.amountTextField.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
