//
//  AppDelegate.swift
//  DigiBank
//
//  Created by priya.kashid on 15/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        // Override point for customization after application launch.
        
        UIApplication.shared.isStatusBarHidden = true
        
        // For Multiple language : localization
        L102Localizer.DoTheMagic()
        
        // For left Drawer
        self.createMenuView()
        
        return true
    }
    
   fileprivate func createMenuView() {
        
    let mainViewController = UIStoryboard(name: Constants.storyBoardName.main, bundle: nil).instantiateViewController(withIdentifier: "DashboardVc") as! DashboardViewController
         
         let leftViewController = UIStoryboard(name: Constants.storyBoardName.main, bundle: nil).instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
         
         let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
         //UINavigationBar.appearance().barTintColor = UIColor.green //barTintColor
         leftViewController.accountOverViewViewController = nvc
         let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
         slideMenuController.automaticallyAdjustsScrollViewInsets = true
         slideMenuController.delegate = mainViewController as? SlideMenuControllerDelegate
         
         self.window?.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
         self.window?.rootViewController = slideMenuController
         self.window?.makeKeyAndVisible()
     }
}

