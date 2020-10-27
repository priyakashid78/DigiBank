//
//  UIViewControllerExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit
extension UIViewController {
    
    func setNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: Constants.DrawerMenuIcon.leftDrawerbuttonIcon)!) 
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
    }
    
    func setRightDrawer(){
        //self.addRightBarButtonWithImage(UIImage(named: StringConstants.ImageNames.filterChannel)!)
        self.toggleRight()
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addRightGestures()
    }
    
    func setRightDrawerForPavilion(){
        //self.addRightBarButtonWithImage(UIImage(named: StringConstants.ImageNames.clock)!)
        self.toggleRight()
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addRightGestures()
    }
    
//    func setRightDrawerForNotification(){
//        self.addRightBarButtonWithImage(UIImage(named: StringConstants.ImageNames.notificationBell)!)
//        self.slideMenuController()?.removeLeftGestures()
//        self.slideMenuController()?.removeRightGestures()
//        self.slideMenuController()?.addRightGestures()
//    }
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
    }
    
    func removeRightDrawerOnApplyFiterButton()  {
        self.closeRight()
    }
    
    func openRightDrawerOnDashBoard()  {
        self.openRight()
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addRightGestures()

    }
}


