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
    struct navigationbarImage {
        static let userImage  = "Group 96"
        static let languageBlue  = "translate"
        static let logoutBlue  = "Group 95"
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
    
    struct FundTransfer {
        
        static let Fund = "Fund"
        static let Transfer = "Transfer"
        static let Notices = "With Internet Banking, transferring funds is very simple.There are many options provided online for transferring funds."
        static let accToSameBank = "Transfer fund to another account with same bank"
        static let toOtherAcc = "Transfer funds to other Bank Account"
        static let ToSameBank = "Transfer funds to other same Bank Account"
        static let imps = "Transfer funds through IMPS using mobile number and MMID"
        static let TransactionType = "Transfer funds to your own account"
        static let otpValidation = "Enter Validate OTP"
        
        
        //Image
        static let buttonImage1 = "Group 4101"
        static let buttonImage2 = "Component3"
        static let buttonImage3 = "Component2"
        static let buttonImage4 = "Component4"
        
        static let buttonImage01 = "fundtransfer_icon_1"
        static let buttonImage02 = "fundtransfer_icon_2"
        static let buttonImage03 = "fundtransfer_icon_3"
        static let buttonImage04 = "fundtransfer_icon_4"
        
        //DropArray
        static let savingAcc = "Saving Account(INR) 001XXXXXXXXXXXXX"
        static let currentAcc = "Current Account(INR) 002XXXXXXXXXXXXX"
        static let paymentTypeOneTime = "One Time"
        static let paymentTypeRe = "Recurring"
        
        //AlertString
        static let fromAccStringValidation = "Select Any Of the Account"
        static let paymentValidation = "Select Payment Type"
        static let amountValidation = "Please Enter amount."
        static let remarkValidation = "Enter Remark"
        static let toAccValidation = "Enter 16 digit Account number"
        
        //Grid
        static let oGridValidate = "Enter O Grid Digits"
        static let cGridValidate = "Enter C Grid Digits"
        static let gGridValidate = "Enter G Grid Digits"
        static let oGridString = "33"
        static let cGridString = "31"
        static let gGridString = "79"
        
        
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
    
    //MARK:- Alert
    
    struct AlertMessage {
        static let btnOK = "OK"
    }
    
    //Mark :- AccountOverview My Transaction List
    
    struct MyTransactionDate {
        static let firstDate = "06/10/2017"
        static let secondDate = "03/10/2017"
        static let thirdDate = "05/10/2017"
        static let fourthDate = "01/10/2017"
        static let fifthDate = "28/09/2017"
    }
    
    struct MyTransactionPayeeType {
        static let firstType = "Transfer Funds to Other Bank Accounts / Credit Cards"
        static let secondType = "Transfer Funds to any other ICICI bank account"
        static let thirdType = "Transfer Funds to Other Bank Accounts / Credit Cards"
        static let fourthType = "Transfer Funds to an account in other bank through IMPS with IFSC code"
        static let fifthType = "Transfer Funds to an account in other bank through IMPS with IFSC code"
    }
    
    struct MyTransactionPayeeNM {
        static let firstNM = "XYZ"
        static let secondNM = "ABC"
        static let thirdNM = "DFDF"
        static let fourthNM = "ERERE"
        static let fifthNM = "IUYIU"
    }
    
    struct MyTransactionAmtIdStatus {
        static let AMT = "30,000"
        static let ID = "165165156"
        static let Status = "Success"
    }
    
    //Mark :- AccountOverview Fund Transfer
    
    struct FundTransferDate {
        static let firstDate = "15/09/2017"
        static let secondDate = "19/09/2017"
        static let thirdDate = "23/09/2017"
        static let fourthDate = "05/10/2017"
        static let fifthDate = "18/10/2017"
        static let sixthDate = "23/10/2017"
    }
    
    struct FundTransferPayeeType {
        static let firstType = "Other bank account using NEFT/RTGS"
        static let secondType = "Other bank account using NEFT/RTGS"
        static let thirdType = "Other bank account using NEFT/RTGS"
        static let fourthType = "Other bank account using NEFT/RTGS"
        static let fifthType = "Other bank account using NEFT/RTGS"
        static let sixthType = "Other bank account using NEFT/RTGS "
    }
       
    struct FundTransferPayeeNM {
        static let firstNM = "FDFSA"
        static let secondNM = "VWSDFSDF"
        static let thirdNM = "TRSDGVV"
        static let fourthNM = "JHJDSFG"
        static let fifthNM = "DFHGDH"
        static let sixthNM = "SDFDFD"
    }
    
    struct FundTransferBenificiaryDetails {
        static let firstBenificiaryDetails = "989165654"
        static let secondBenificiaryDetails = "95665445"
        static let thirdBenificiaryDetails = "654165465"
        static let fourthBenificiaryDetails = "91654541"
        static let fifthBenificiaryDetails = "991958145"
        static let sixthBenificiaryDetails = "85154454"
    }
    
    struct FundTransferAmount {
        static let firstAmount = "5,000"
        static let secondAmount = "90,000"
        static let thirdAmount = "5,00,000"
        static let fourthAmount = "10,000"
        static let fifthAmount = "70,000"
        static let sixthAmount = "3,000"
    }
}
