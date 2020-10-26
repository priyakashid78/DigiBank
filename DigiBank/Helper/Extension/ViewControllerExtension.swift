//
//  ViewControllerExtension.swift
//  DigiBank
//
//  Created by priya.kashid on 22/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alert(imageName: String, message: String, title: String ) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let image = UIImageView(image: UIImage(named: imageName))
//        alertController.view.addSubview(image)
//        image.translatesAutoresizingMaskIntoConstraints = false
//        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 80
//        )
//        
//        alertController.view.addConstraint(NSLayoutConstraint(item: image, attribute: .centerX, relatedBy: .equal, toItem: alertController.view, attribute: .centerX, multiplier: 1, constant: 0))
//        //        alertController.view.addConstraint(NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: alertController.view, attribute: .centerY, multiplier: 1, constant: 0))
//        alertController.view.addConstraint(NSLayoutConstraint(item: image, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0))
//        alertController.view.addConstraint(NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0))
//        
//        
//        alertController.view.addConstraint(height);
        
        present(alertController, animated: true) {
            self.perform(#selector(self.dismissAlertController(alertController:)), with: alertController, afterDelay: 2.0)
        }
    }
    
    @objc internal func dismissAlertController(alertController: UIAlertController) {
        alertController.dismiss(animated: true, completion: nil)
    }
    
}
