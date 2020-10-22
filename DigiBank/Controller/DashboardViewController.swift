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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- IBAction
    
    @IBAction func logoutAction(_ sender: Any) {
    }
    @IBAction func profileAction(_ sender: Any) {
    }
    @IBAction func getInTouchAction(_ sender: Any) {
    }
    @IBAction func contactAction(_ sender: Any) {
    }
    @IBAction func languageChangeAction(_ sender: Any) {
    }
    
    @IBAction func netBankingAction(_ sender: Any) {
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
        
    }
    
}