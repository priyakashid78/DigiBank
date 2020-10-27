//
//  StringConstants.swift
//  HotCoffee
//
//  Created by priya.kashid on 15/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import Foundation

struct Constants {
    
    //MARK:- String
    struct placeholders {
        static let signUpPlaceholder = "Comment"
    }
    
    struct alertString {
         
        static let Error = "Warning"
         static let success = "Success"
        static let successLogin = "Congratulation signIn successful"
        static let successSignUp = "Congratulation signup successful now you can login"
        static let contactSend = "Sit back and relax we'll get back to you within 24 hours"
    }
     struct validateString {
        
        static let emailAlert = "Please Enter validate Email Id"
        static let passwordAlert = "Please Enter Password."
        static let signUppasswordAlert = "Username and Password cannot be same."
        static let firstNAlert = "Please Enter User First Name"
        static let lastNAlert = "Please Enter validate Last Name"
        static let mobileAlert = "Enter 10 digit mobile no."
        static let userNameAlert = "Enter minimum 3 alphanumeric character for username"
        static let passwordGreater = "Enter minimum 3 alphanumeric character for password"
        static let confirmPassword = "Password do not match"
        static let  signInUserValidation = "Enter Username"

    }
    
    struct storeString {
        static let appLoginFlag = "appLoginFlag"
        static let userName = "userName"
        
    }
    //MARK:- images
     struct loginImages {
        static let secureImage  = "Group 78"
    }
    
    struct alertImages {
        static let checkImage  = "Group 76"
    }
    
    struct DrawerMenuIcon {
        static let leftDrawerbuttonIcon = "Group 94"
    }
    
    struct storyBoardName {
        static let main  = "Main"
        static let dashboard  = "Dashboard"
    }
    
    struct viewControllerNames {
        static let netBankingDashboardViewController = "NetBankingDashboardViewController"
        static let loginToInterNetBankingViewController = "LoginToInterNetBankingViewController"
        static let accountOverViewViewController = "AccountOverViewViewController"
    }
}
