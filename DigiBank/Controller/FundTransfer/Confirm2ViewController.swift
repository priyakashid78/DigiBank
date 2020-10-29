//
//  Confirm2ViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 28/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class Confirm2ViewController: UIViewController {
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var amountLable: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var remarkLabel: UILabel!
    @IBOutlet weak var paymentTypeLabel: UILabel!
    
    @IBOutlet weak var confirm: UIButton!
    
    var amountString: String?
    var fromAccountString: String?
    var toAccountString: String?
    var remarkString: String?
    var paymentModeString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        confirm.setGradient(color: [AppColor.greenDark, AppColor.greenlight])
        
        fromLabel.text = self.fromAccountString
        paymentTypeLabel.text = self.paymentModeString
        remarkLabel.text = self.remarkString
        amountLable.text = self.amountString
        toLabel.text = self.toAccountString
        dateLabel.text = Date().toString(dateFormat: "dd/MM/YYYY")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ConfirmAction() {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "gride2VC") as! GridViewController
        vc.fromAccountString = self.fromAccountString
        vc.toAccountString = self.toAccountString
        vc.paymentModeString = self.paymentModeString
        vc.remarkString = self.remarkString
        vc.amountString =  self.amountString
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
