//
//  ConfirmPayeeViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 30/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class ConfirmPayeeViewController: UIViewController {
    
    @IBOutlet weak var payeeNameLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var paymentAccLabel: UILabel!
    @IBOutlet weak var branchLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var ifscLabel: UILabel!
    
    var payeeNameString: String?
    var nickNameString: String?
    var paymentAccString: String?
    var branchString: String?
    var mobileString: String?
    var ifscString: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        payeeNameLabel.text = self.payeeNameString
        nickNameLabel.text = self.nickNameString
        paymentAccLabel.text = self.paymentAccString
        mobileLabel.text = self.mobileString
        branchLabel.text = self.branchString
        ifscLabel.text = self.ifscString
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        //For left Drawer
               self.setNavigationBarItem()
               navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ConfirmAction() {
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "URNVc") as! URNViewController
        vc.accNumber = self.paymentAccString
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
}
