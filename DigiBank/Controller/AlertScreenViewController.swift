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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "DashboardVc") as! DashboardViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
        // Do any additional setup after loading the view.
    }
    

 

}
