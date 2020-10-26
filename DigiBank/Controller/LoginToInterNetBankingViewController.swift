//
//  LoginToInterNetBankingViewController.swift
//  DigiBank
//
//  Created by baban.jadhav on 23/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class LoginToInterNetBankingViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtCustId: UITextField!
    @IBOutlet weak var viewOfBackPassword: UIView!
    @IBOutlet weak var viewOfBackCustId: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initialDesign()
    }
    
    func initialDesign() {
        
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnLoginClick(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
