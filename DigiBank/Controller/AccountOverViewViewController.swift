//
//  AccountOverViewViewController.swift
//  DigiBank
//
//  Created by baban.jadhav on 26/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class AccountOverViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //For left Drawer
        self.setNavigationBarItem()
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

