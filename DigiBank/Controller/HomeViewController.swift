//
//  HomeViewController.swift
//  LeftDrawer
//
//  Created by JAYESH JOSHI on 27/10/20.
//  Copyright © 2020 baban.jadhav. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad HomeViewController")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
           //For left Drawer
           self.setNavigationBarItem()
           print("viewWillAppear HomeViewController")
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
