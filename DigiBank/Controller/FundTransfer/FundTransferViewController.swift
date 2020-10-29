//
//  FundTransferViewController.swift
//  DigiBank
//
//  Created by baban.jadhav on 27/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class FundTransferViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var title2: UILabel!
    @IBOutlet var titleLabel: UILabel!
    var tableData = [String]()
    var imageData = [String]()
    var mainImageData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.estimatedRowHeight = 1000
        tableView.rowHeight = UITableView.automaticDimension
        tableData = [Constants.FundTransfer.accToSameBank, Constants.FundTransfer.toOtherAcc, Constants.FundTransfer.ToSameBank,Constants.FundTransfer.imps]
        imageData =  [Constants.FundTransfer.buttonImage1, Constants.FundTransfer.buttonImage2, Constants.FundTransfer.buttonImage3,Constants.FundTransfer.buttonImage4]
        mainImageData =  [Constants.FundTransfer.buttonImage01, Constants.FundTransfer.buttonImage02, Constants.FundTransfer.buttonImage03,Constants.FundTransfer.buttonImage04]
        titleLabel.attributedText = "".withBoldText(text1: "Fund ", text2: "Transfer")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: AppColor.accountOveriewSreenCode)
        //For left Drawer
        self.setNavigationBarItem()
        self.setRightBar()
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
    
    //MARK:- Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FundTransferCell", for: indexPath) as! FundTransferCell
        cell.labelText.text = tableData[indexPath.row]
        cell.buttonImage.image = UIImage(named:imageData[indexPath.row])
        cell.mainImage.image = UIImage(named:mainImageData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
           
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "FTtoSameBankVc") as! FTtoBank1ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "FTOtherBank") as! FTOtherBankViewController
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("")
        }
    }
    
}
