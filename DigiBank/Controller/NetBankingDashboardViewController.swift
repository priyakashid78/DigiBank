//
//  NetBankingDashboardViewController.swift
//  DigiBank
//
//  Created by baban.jadhav on 23/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class NetBankingDashboardViewController: UIViewController {

    @IBOutlet weak var lblNetBankingCoursesTitle: UILabel!
    @IBOutlet weak var lblNetBankingCoursesSubtitle: UILabel!
    @IBOutlet weak var lblNetBankingCoursesDescription: UILabel!
    @IBOutlet weak var lblInstructioinTitle: UILabel!
    @IBOutlet weak var lblInstructionStep1: UILabel!
    @IBOutlet weak var lblInstructionStep2: UILabel!
    @IBOutlet weak var lblInstructionStep3: UILabel!
    @IBOutlet weak var lblLoginTitle: UILabel!
    @IBOutlet weak var lblLoginDescription: UILabel!
    @IBOutlet weak var lblGenericStepsToLoginTitle: UILabel!
    @IBOutlet weak var lblGenericStepToLogin1: UILabel!
    @IBOutlet weak var lblGenericStepToLogin2: UILabel!
    @IBOutlet weak var lblGenericStepToLogin3: UILabel!
    @IBOutlet weak var lblGenericStepToLogin4: UILabel!
    @IBOutlet weak var lblGenericStepToLogi5: UILabel!
    @IBOutlet weak var lblGenericStepToLogin6: UILabel!
    
    @IBOutlet weak var lblSafetyPreCaustionTitle: UILabel!
    @IBOutlet weak var lblSafetyPreCaustionDescri1: UILabel!
    @IBOutlet weak var lblSafetyPreCaustionDescr2: UILabel!
    @IBOutlet weak var lblSafetyPreCaustionDescri3: UILabel!
    
    @IBOutlet weak var lblSafetyPreCaustionDescri4: UILabel!
    @IBOutlet weak var lblSafetyPreCaustionDescr5: UILabel!
    @IBOutlet weak var lblSafetyPreCaustionDescri6: UILabel!
    @IBOutlet weak var lblInternetOrNetBankingFeatureTitle: UILabel!
    @IBOutlet weak var lblInternetOrNetBankingFeatureList1: UILabel!
    @IBOutlet weak var lblInternetOrNetBankingFeatureList2: UILabel!
    @IBOutlet weak var lblInternetOrNetBankingFeatureList3: UILabel!
    @IBOutlet weak var lblInternetOrNetBankingFeatureList4: UILabel!
    @IBOutlet weak var lblInternetOrNetBankingFeatureList5: UILabel!
    @IBOutlet weak var lblInternetOrNetBankingFeatureList6: UILabel!
    @IBOutlet weak var lblInternetOrNetBankingFeatureLis7: UILabel!
    @IBOutlet weak var lblInternetOrNetBankingFeatureList8: UILabel!
    @IBOutlet weak var lblInternetOrNetBankingFeatureList9: UILabel!
    
    @IBOutlet weak var lblInternetOrNetBankingFeatureList10: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnLetsGetStartedClicked(_ sender: Any) {
        let loginToInterNetBankingViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.viewControllerNames.loginToInterNetBankingViewController) as! LoginToInterNetBankingViewController
//        loginToInterNetBankingViewController.modalPresentationStyle = .overFullScreen
//        self.present(loginToInterNetBankingViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(loginToInterNetBankingViewController, animated: true)
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
