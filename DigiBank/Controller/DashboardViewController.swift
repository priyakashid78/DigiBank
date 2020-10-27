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
    override func viewDidLoad() {
        super.viewDidLoad()
        CommonSupport.statusBarColor(mycolor: AppColor.appPrimaryColorDark!)
        loginButton.customButton(padding: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func netBankingAction(_ sender: Any) {
        let optionalBool: Bool? = UserDefaults.standard.bool(forKey: Constants.storeString.appLoginFlag)
        guard optionalBool == true else {
            //Move to login
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
            return
        }
        
        //Move to Netbanking demo
        let dashboard : UIStoryboard = UIStoryboard(name: Constants.storyBoardName.dashboard, bundle:nil)
        let vc = dashboard.instantiateViewController(withIdentifier: Constants.viewControllerNames.netBankingDashboardViewController) as! NetBankingDashboardViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
        L102Language.setAppleLAnguageTo(lang:"en")
        print("HELLO_WORLD",NSLocalizedString("HELLO_WORLD", comment: ""))
    }
    @IBAction func mobileBanking(_ sender: Any) {
        L102Language.setAppleLAnguageTo(lang:"mr")
        print("HELLO_WORLD",NSLocalizedString("HELLO_WORLD", comment: ""))
    }
    @IBAction func walletBankingAction(_ sender: Any) {
        L102Language.setAppleLAnguageTo(lang:"hi")
        print("HELLO_WORLD",NSLocalizedString("HELLO_WORLD", comment: ""))
    }
    @IBAction func microPayAction(_ sender: Any) {
        L102Language.setAppleLAnguageTo(lang:"en")
        print("HELLO_WORLD",NSLocalizedString("HELLO_WORLD", comment: ""))
        
    }
    
}
