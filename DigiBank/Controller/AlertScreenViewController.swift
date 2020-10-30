//
//  AlertScreenViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 28/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class AlertScreenViewController: UIViewController {

    var stringToDisplay:String?
    var VCString:String?
   
    @IBOutlet var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = stringToDisplay
        navigationController?.setNavigationBarHidden(true, animated: false)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if self.VCString == "4"{
                let dashboardStoryboard = UIStoryboard(name:Constants.storyBoardName.dashboard, bundle: nil)
                let vc = dashboardStoryboard.instantiateViewController(withIdentifier: "AccountOverViewViewController") as! AccountOverViewViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "DashboardVc") as! DashboardViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        // Do any additional setup after loading the view.
    }
}
