//
//  NetBankingDashboardViewController.swift
//  DigiBank
//
//  Created by baban.jadhav on 23/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class NetBankingDashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnLetsGetStartedClicked(_ sender: Any) {
        let loginToInterNetBankingViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.viewControllerNames.loginToInterNetBankingViewController) as! LoginToInterNetBankingViewController
        loginToInterNetBankingViewController.modalPresentationStyle = .overFullScreen
        self.present(loginToInterNetBankingViewController, animated: true, completion: nil)
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
