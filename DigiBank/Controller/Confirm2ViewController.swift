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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        confirm.setGradient(color: [AppColor.greenDark, AppColor.greenlight])
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction() {
     self.navigationController?.popViewController(animated: true)
    }

}
