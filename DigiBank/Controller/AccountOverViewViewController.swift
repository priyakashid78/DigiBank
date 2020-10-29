//
//  AccountOverViewViewController.swift
//  DigiBank
//
//  Created by baban.jadhav on 26/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class AccountOverViewViewController: UIViewController {
    
    @IBOutlet weak var tblMyTransactionList: UITableView!
    @IBOutlet weak var tblMyBillPayment: UITableView!
    @IBOutlet weak var heightOfTblMyTransactionList: NSLayoutConstraint!
    @IBOutlet weak var heightOfTblMyBillPayments: NSLayoutConstraint!
    
    var arrOfMyTransactionDate : [String] = [Constants.MyTransactionDate.firstDate,Constants.MyTransactionDate.secondDate,Constants.MyTransactionDate.thirdDate,Constants.MyTransactionDate.fourthDate,Constants.MyTransactionDate.fifthDate]
    var arrOfMyTransactionType : [String] = [Constants.MyTransactionPayeeType.firstType,Constants.MyTransactionPayeeType.secondType,Constants.MyTransactionPayeeType.thirdType,Constants.MyTransactionPayeeType.fourthType,Constants.MyTransactionPayeeType.fifthType]
    var arrOfMyTransactionPayeeNM : [String] = [Constants.MyTransactionPayeeNM.firstNM,Constants.MyTransactionPayeeNM.secondNM,Constants.MyTransactionPayeeNM.thirdNM,Constants.MyTransactionPayeeNM.fourthNM,Constants.MyTransactionPayeeNM.fifthNM]
    var arrOfMyTransactionPayeeAMT : [String] = [Constants.MyTransactionAmtIdStatus.AMT,Constants.MyTransactionAmtIdStatus.AMT,Constants.MyTransactionAmtIdStatus.AMT,Constants.MyTransactionAmtIdStatus.AMT,Constants.MyTransactionAmtIdStatus.AMT]
    var arrOfMyTransactionPayeeId : [String] = [Constants.MyTransactionAmtIdStatus.ID,Constants.MyTransactionAmtIdStatus.ID,Constants.MyTransactionAmtIdStatus.ID,Constants.MyTransactionAmtIdStatus.ID,Constants.MyTransactionAmtIdStatus.ID]
    var arrOfMyTransactionStatus : [String] = [Constants.MyTransactionAmtIdStatus.Status,Constants.MyTransactionAmtIdStatus.Status,Constants.MyTransactionAmtIdStatus.Status,Constants.MyTransactionAmtIdStatus.Status,Constants.MyTransactionAmtIdStatus.Status]
    
    
    var arrOfFundTransferDate : [String] = [Constants.FundTransferDate.firstDate,Constants.FundTransferDate.secondDate,Constants.FundTransferDate.thirdDate,Constants.FundTransferDate.fourthDate,Constants.FundTransferDate.fifthDate,Constants.FundTransferDate.sixthDate]
    var arrOfFundTransferPayeeType : [String] = [Constants.FundTransferPayeeType.firstType,Constants.FundTransferPayeeType.secondType,Constants.FundTransferPayeeType.thirdType,Constants.FundTransferPayeeType.fourthType,Constants.FundTransferPayeeType.fifthType,Constants.FundTransferPayeeType.sixthType]
    var arrOfFundTransferPayeeNM : [String] = [Constants.FundTransferPayeeNM.firstNM,Constants.FundTransferPayeeNM.secondNM,Constants.FundTransferPayeeNM.thirdNM,Constants.FundTransferPayeeNM.fourthNM,Constants.FundTransferPayeeNM.fifthNM,Constants.FundTransferPayeeNM.sixthNM]
    var arrOfFundTransferBenificiaryDetails : [String] = [Constants.FundTransferBenificiaryDetails.firstBenificiaryDetails,Constants.FundTransferBenificiaryDetails.secondBenificiaryDetails,Constants.FundTransferBenificiaryDetails.thirdBenificiaryDetails,Constants.FundTransferBenificiaryDetails.fourthBenificiaryDetails,Constants.FundTransferBenificiaryDetails.fifthBenificiaryDetails,Constants.FundTransferBenificiaryDetails.sixthBenificiaryDetails]
    var arrOfFundTransferAmount : [String] = [Constants.FundTransferAmount.firstAmount,Constants.FundTransferAmount.secondAmount,Constants.FundTransferAmount.thirdAmount,Constants.FundTransferAmount.fourthAmount,Constants.FundTransferAmount.fifthAmount,Constants.FundTransferAmount.sixthAmount]
    
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
    
    override func viewDidLayoutSubviews() {
        super.updateViewConstraints()
        heightOfTblMyTransactionList.constant = CGFloat(arrOfMyTransactionDate.count * 54)
        heightOfTblMyBillPayments.constant = CGFloat(arrOfFundTransferDate.count * 54)
        self.updateViewConstraints()
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


//  MARK:- TableView Delegate Methods
extension AccountOverViewViewController :
UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblMyTransactionList{
            return arrOfMyTransactionDate.count
        }else{
            return arrOfFundTransferDate.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tblMyTransactionList{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTransactionTableViewCell", for: indexPath) as! MyTransactionTableViewCell
            cell.selectionStyle = .none
            tableView.allowsSelection = true
            cell.lblTransactionDate.text = arrOfMyTransactionDate[indexPath.row]
            cell.lblTransactionType.text = arrOfMyTransactionType[indexPath.row]
            cell.lblPayeeName.text = arrOfMyTransactionPayeeNM[indexPath.row]
            cell.lblTotalAmount.text = arrOfMyTransactionPayeeAMT[indexPath.row]
            cell.lblPaymentId.text = arrOfMyTransactionPayeeId[indexPath.row]
            cell.lblStatus.text = arrOfMyTransactionStatus[indexPath.row]
            
            if indexPath.row % 2 == 0 {
                cell.contentView.backgroundColor = UIColorFromRGB.init(rgb: AppColor.backgroundColorOfMyTransactionCell1)
            }else{
                cell.contentView.backgroundColor = UIColorFromRGB.init(rgb: AppColor.backgroundColorOfMyTransactionCell2)
            }
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyBillPaymentTableViewCell", for: indexPath) as! MyBillPaymentTableViewCell
            cell.selectionStyle = .none
            tableView.allowsSelection = true

            cell.lblTransactionDate.text = arrOfFundTransferDate[indexPath.row]
            cell.lblTransactionType.text = arrOfFundTransferPayeeType[indexPath.row]
            cell.lblPayeeName.text = arrOfFundTransferPayeeNM[indexPath.row]
            cell.lblBeneficiaryDetails.text = arrOfFundTransferBenificiaryDetails[indexPath.row]
            cell.lblAmount.text = arrOfFundTransferAmount[indexPath.row]
            
            if indexPath.row % 2 == 0 {
                cell.contentView.backgroundColor = UIColorFromRGB.init(rgb: AppColor.backgroundColorOfMyTransactionCell1)
            }else{
                cell.contentView.backgroundColor = UIColorFromRGB.init(rgb: AppColor.backgroundColorOfMyTransactionCell2)
            }
            return cell
            
        }
        
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = UIEdgeInsets.zero
        }
        if cell.responds(to: #selector(setter: UIView.preservesSuperviewLayoutMargins)) {
            cell.preservesSuperviewLayoutMargins = false
        }
        if cell.responds(to: #selector(setter: UIView.layoutMargins)) {
            cell.layoutMargins = UIEdgeInsets.zero
        }
    }
}
