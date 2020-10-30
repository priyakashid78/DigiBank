//
//  EReceiptViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 29/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class EReceiptViewController: UIViewController {
    
    var amountString: String?
    var fromAccountString: String?
    var toAccountString: String?
    var remarkString: String?
    var paymentModeString: String?
    var flag: String?
    
    
   
    @IBOutlet weak var paymentModeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var fromAccLabel: UILabel!
    @IBOutlet weak var creditAccLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var remarkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentModeLabel.text = paymentModeString
        fromAccLabel.text = fromAccountString
        creditAccLabel.text = toAccountString
        dateLabel.text = Date().toString(dateFormat: "dd/MM/YYYY")
        remarkLabel.text = remarkString
        amountLabel.text = amountString
        // Do any additional setup after loading the view.
    }
    
   override func viewWillAppear(_ animated: Bool) {
        //For left Drawer
        self.setNavigationBarItem()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func submitAction() {
        let dashboardStoryboard = UIStoryboard(name: Constants.storyBoardName.dashboard, bundle: nil)
        let vc = dashboardStoryboard.instantiateViewController(withIdentifier: "FundTransferViewController") as! FundTransferViewController
        if let nav = self.navigationController {
            for controller in nav.viewControllers as Array {
                if controller is FundTransferViewController {
                    let _ = nav.popToViewController(controller as UIViewController, animated: false)
                    break
                }
            }
            nav.pushViewController(vc, animated: false)
            return
        }
    }
}
