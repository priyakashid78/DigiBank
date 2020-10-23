//
//  ContactViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 21/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.customTextfield()
        nameTextfield.customTextfield()
        
        commentTextView.delegate = self
        commentTextView.setPlaceholder()
        
        
        commentTextView.backgroundColor = UIColor.white
        commentTextView.layer.cornerRadius = 24
        commentTextView.layer.masksToBounds = true
        
        //To apply border
        commentTextView.layer.borderWidth = 0.25
        commentTextView.layer.borderColor = UIColor.white.cgColor
        
        commentTextView.layer.shadowColor = AppColor.ShadowColor.TextFieldShadowColor?.cgColor
        commentTextView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        commentTextView.layer.shadowOpacity = 0.2
        commentTextView.layer.shadowRadius = 4.0
       
        commentTextView.clipsToBounds = false
        
        
        commentTextView.leftSpace()

    }
    //MARK:- UITextField delegate
    
    func textViewDidChange(_ textView: UITextView) {
        commentTextView.checkPlaceholder()
    }
    
    //MARK:- IBAction
    
    @IBAction func sumbitAction(_ sender: Any) {
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.backNavigation()
    }
    
    //MARK:- Function
    func backNavigation() {
        self.dismiss(animated: true, completion: nil)
    }
   
}
