//
//  URNViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 02/11/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit


protocol URNControllerDelegate {
    
    func showAlert(title: String, errorMessage: String, imageName: String)
    func moveToNext()
}

class URNViewController: UIViewController, UITextFieldDelegate, URNControllerDelegate, FTSameViewCDelegate {
    
    @IBOutlet weak var OTPTextField1: UITextField!
    @IBOutlet weak var OTpLabel: UILabel!
    
    var urnString: String?
    var accNumber: String?
    let viewModel = URNViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        urnString = random()
        OTpLabel.text = urnString
        self.setUpView()
        OTPTextField1.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
      
        // Do any additional setup after loading the view.
    }
    func setUpView() {
        
        OTPTextField1.customTextfield()
        
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
        
         OTPTextField1.becomeFirstResponder()
    }
    
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ConfirmAction() {
        
        let userotp: String = "\(OTPTextField1.text ?? "0")"
        print(userotp)
        viewModel.sendValue(userURN: OTPTextField1.text, generatorURN: urnString)
    }
    
    func random() -> String {
        var result = ""
        repeat {
            result = String(format:"%06d", arc4random_uniform(1000000) )
        } while result.count < 6 || Int(result)! < 100000
        print(result)
        return result
    }
    
    func showAlert(title: String, errorMessage: String, imageName: String) {
        
        self.alert(imageName: Constants.alertImages.checkImage, message: errorMessage, title: title)
    }
    
    func moveToNext() {
        
        let defaults = UserDefaults.standard
     
        var originalArray = defaults.stringArray(forKey: Constants.storeString.payeeArray) ?? [String]()
        originalArray.append(accNumber!)
        defaults.set(originalArray, forKey:  Constants.storeString.payeeArray)
        
       let vc = self.storyboard!.instantiateViewController(withIdentifier: "FTOtherBank") as! FTOtherBankViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
