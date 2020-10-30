//
//  OTPScreenViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 29/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol OTPViewControllerDelegate {
    
    func showAlert(title: String, errorMessage: String, imageName: String)
    func moveToNext()
}

class OTPScreenViewController: UIViewController, UITextFieldDelegate, OTPViewControllerDelegate, FTSameViewCDelegate {
    
    
    @IBOutlet weak var OTPTextField1: UITextField!
    @IBOutlet weak var OTPTextField2: UITextField!
    @IBOutlet weak var OTPTextField3: UITextField!
    @IBOutlet weak var OTPTextField4: UITextField!
    @IBOutlet weak var OTpLabel: UILabel!
    var otpStringRandom: String?
    
    var amountString: String?
    var fromAccountString: String?
    var toAccountString: String?
    var remarkString: String?
    var paymentModeString: String?
    
    let viewModel = OTPViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        otpStringRandom = random()
        OTpLabel.text = otpStringRandom
        self.setUpView()
        OTPTextField1.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        OTPTextField2.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        OTPTextField3.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        OTPTextField4.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        // Do any additional setup after loading the view.
    }
    func setUpView() {
        
        OTPTextField1.customTextfield()
        OTPTextField2.customTextfield()
        OTPTextField3.customTextfield()
        OTPTextField4.customTextfield()
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool
    {
        
            let charsLimit = 1
            
            let startingLength = textField.text?.count ?? 0
            let lengthToAdd = string.count
            let lengthToReplace =  range.length
            let newLength = startingLength + lengthToAdd - lengthToReplace
            
            return newLength <= charsLimit
       
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    @objc func textFieldDidChange(textField: UITextField){
        
        let text = textField.text
        
        if text?.utf16.count ?? 0 >= 1{
            switch textField{
            case OTPTextField1:
                OTPTextField2.becomeFirstResponder()
            case OTPTextField2:
                OTPTextField3.becomeFirstResponder()
            case OTPTextField3:
                OTPTextField4.becomeFirstResponder()
            case OTPTextField4:
                OTPTextField4.resignFirstResponder()
            default:
                break
            }
        }else{
            
        }
    }
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ConfirmAction() {
        
        let userotp: String = "\(OTPTextField1.text ?? "0")\(OTPTextField2.text ?? "0")\(OTPTextField3.text ?? "0")\(OTPTextField4.text ?? "0")"
        print(userotp)
        viewModel.sendValue(userOTP: userotp, generatorOTP:otpStringRandom )
    }
    
    func random() -> String {
        var result = ""
        repeat {
            result = String(format:"%04d", arc4random_uniform(10000) )
        } while result.count < 4 || Int(result)! < 1000
        print(result)
        return result
    }
    
    func showAlert(title: String, errorMessage: String, imageName: String) {
        
        self.alert(imageName: Constants.alertImages.checkImage, message: errorMessage, title: title)
    }
    
    func moveToNext() {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "receiptVc") as! EReceiptViewController
        vc.fromAccountString = self.fromAccountString
        vc.toAccountString = self.toAccountString
        vc.paymentModeString = self.paymentModeString
        vc.remarkString = self.remarkString
        vc.amountString =  self.amountString
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
