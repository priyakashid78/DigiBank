//
//  StringConstants.swift
//  HotCoffee
//
//  Created by priya.kashid on 15/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import Foundation

struct Constants {
    
    static let EMPTY = ""
    
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
        static let forgotEmsil = "Password reset link has been successfully sent to your email address"
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
    
    struct drawerMenuNameList {
        static let accountOverView = "Account Overview"
        static let fundTransfer = "Fund Transfer"
        static let managePayee = "Manage Payee"
        static let eStatment = "E-Statement"
    }
    
    struct storeString {
        static let appLoginFlag = "appLoginFlag"
        static let userName = "userName"
        
    }

    struct languageString {
           static let english = "English"
           static let hindi = "Hindi"
           static let marathi = "Marathi"
           
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
        static let crossIcon = "Group 97"
        static let accountOverView = "Group 410"
        static let fundTransfer = "Group 411"
        static let managePayee = "Group 412"
        static let eStatment = "Group 413"
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
