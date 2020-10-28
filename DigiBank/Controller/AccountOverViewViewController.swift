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
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: AppColor.accountOveriewSreenCode)
        //For left Drawer
        self.setNavigationBarItem()
    }
    
    func setRightBar() {
        
        let logout = UIBarButtonItem(image: UIImage(named: Constants.navigationbarImage.logoutBlue), style: .plain, target: self, action: #selector(self.logoutNetBanking(sender:)))
        let userImage = UIBarButtonItem(image: UIImage(named: Constants.navigationbarImage.userImage),  style: .plain, target: self, action: nil)
        let language = UIBarButtonItem(image: UIImage(named: Constants.navigationbarImage.languageBlue),  style: .plain, target: self, action: #selector(self.languageChange(sender:)))
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        navigationController?.navigationBar.tintColor = AppColor.appPrimaryColorDark
        navigationItem.rightBarButtonItems = [logout,userImage,language]
    }
    
    @objc func logoutNetBanking(sender: AnyObject){
        
    }
    
    @objc func languageChange(sender: AnyObject){
        
    }
    
}

