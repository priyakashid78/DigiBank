//
//  GlobalFunctions.swift
//  DigiBank
//
//  Created by priya.kashid on 27/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class CommonSupport {
    
static func statusBarColor(mycolor: UIColor) {
       if #available(iOS 13.0, *) {

           let keywindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

           let statusBar = UIView(frame: keywindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
           statusBar.backgroundColor = mycolor
           statusBar.tag = 100
           keywindow?.addSubview(statusBar)

       } else {

           let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
           statusBar?.backgroundColor = mycolor
       }
   }
    
   
}
