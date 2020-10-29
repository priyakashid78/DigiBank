//
//  GridViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 29/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

protocol GridControllerDelegate {
    
    func showAlert(title: String, errorMessage: String, imageName: String)
    func moveToNextScreen()
}

class GridViewController: UIViewController,GridControllerDelegate {
    
    @IBOutlet weak var gTextField: UITextField!
    @IBOutlet weak var cTextField: UITextField!
    @IBOutlet weak var oTextField: UITextField!
    
    var amountString: String?
    var fromAccountString: String?
    var toAccountString: String?
    var remarkString: String?
    var paymentModeString: String?
    var viewModel = GridViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        self.setUI()
    }
    
    func setUI() {
        gTextField.customTextfield()
        cTextField.customTextfield()
        oTextField.customTextfield()
    }
    
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitAction() {
        viewModel.sendValue(gGrid: gTextField.text, cGrid: cTextField.text, oGrid: oTextField.text)
    }
    
    func showAlert(title: String, errorMessage: String, imageName: String) {
         self.alert(imageName: Constants.alertImages.checkImage, message: errorMessage, title: title)
    }
    
    func moveToNextScreen() {
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "receiptVc") as! EReceiptViewController
        vc.fromAccountString = self.fromAccountString
        vc.toAccountString = self.toAccountString
        vc.paymentModeString = self.paymentModeString
        vc.remarkString = self.remarkString
        vc.amountString =  self.amountString
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
