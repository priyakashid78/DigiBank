//
//  DashboardViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 21/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var userProfileButton: UIButton!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var trailingConstantTranslate: NSLayoutConstraint!
    
    @IBOutlet weak var lblNetBanking: UILabel!
    @IBOutlet weak var lblMobileBanking: UILabel!
    @IBOutlet weak var lbleWallet: UILabel!
    @IBOutlet weak var lblMicroPay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CommonSupport.statusBarColor(mycolor: AppColor.appPrimaryColorDark!)
        loginButton.customButton(padding: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        //Set language
        lblNetBanking.text =  NSLocalizedString("Net_Banking", comment: "")
        lblMobileBanking.text =  NSLocalizedString("Mobile_Banking", comment: "")
        lbleWallet.text =  NSLocalizedString("e_Wallet", comment: "")
        lblMicroPay.text =  NSLocalizedString("Micro_Pay", comment: "")
        
        let optionalBool: Bool? = UserDefaults.standard.bool(forKey: Constants.storeString.appLoginFlag)
        guard optionalBool == true else {
            trailingConstantTranslate.constant = -50
            upperView.isHidden = true
            loginButton.isHidden = false
            return
        }
        upperView.isHidden = false
        loginButton.isHidden = true
        trailingConstantTranslate.constant = -125
    }
    //MARK:- IBAction
    
    @IBAction func logoutAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: Constants.storeString.appLoginFlag)
        UserDefaults.standard.removeObject(forKey: Constants.storeString.userName)
        self.viewDidLoad()
        self.viewWillAppear(true)
      
    }
    @IBAction func profileAction(_ sender: Any) {
    }
    
    @IBAction func languageChangeAction(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "SelectLanguageViewController") as! SelectLanguageViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
//        vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func netBankingAction(_ sender: Any) {
        let optionalBool: Bool? = UserDefaults.standard.bool(forKey: Constants.storeString.appLoginFlag)
        guard optionalBool == true else {
            //Move to login
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
//            vc.modalPresentationStyle = .overFullScreen
//            self.present(vc, animated: true, completion: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        //Move to Netbanking demo
        let dashboard : UIStoryboard = UIStoryboard(name: Constants.storyBoardName.dashboard, bundle:nil)
        let vc = dashboard.instantiateViewController(withIdentifier: Constants.viewControllerNames.netBankingDashboardViewController) as! NetBankingDashboardViewController
//        vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func mobileBanking(_ sender: Any) {
        
    }
    @IBAction func walletBankingAction(_ sender: Any) {
       
    }
    @IBAction func microPayAction(_ sender: Any) {
    
    }
    
    @IBAction func btnGetInTouch(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
        //            vc.modalPresentationStyle = .overFullScreen
        //            self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension DashboardViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}
