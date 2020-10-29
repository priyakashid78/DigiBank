//
//  LeftViewController.swift
//  ShopWIthTi
//
//  Created by JAYESH JOSHI on 16/10/20.
//  Copyright © 2020 JAYESH JOSHI. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
    case accountOverview = 0
    case fundTransfer
    case managePayee
    case eStatement
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController: UIViewController, LeftMenuProtocol {
    
    var arrOfmenus = [String]()
    var arrOfmenuImages = [String]()
    var accountOverViewViewController: UIViewController!
    var fundTransferViewController: UIViewController!
    var managePayeeViewController: UIViewController!
    var eStatementViewController: UIViewController!
    
    @IBOutlet weak var tblMenuList: UITableView!
    
    // Change First Array object to Applied , "Returns"
    
    var storedOffsets = [Int: CGFloat]()

    //  MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        tblMenuList.tableFooterView = UIView()
        tblMenuList.separatorColor = UIColor.clear
        tblMenuList.backgroundColor = UIColor.clear
        
        arrOfmenus = [(NSLocalizedString(Constants.drawerMenuNameList.accountOverView, comment: Constants.EMPTY)),
                      (NSLocalizedString(Constants.drawerMenuNameList.fundTransfer, comment: Constants.EMPTY)) ,
                      (NSLocalizedString(Constants.drawerMenuNameList.managePayee, comment: Constants.EMPTY)),
                      (NSLocalizedString(Constants.drawerMenuNameList.eStatment, comment: Constants.EMPTY))]
        
        arrOfmenuImages = [Constants.DrawerMenuIcon.accountOverView,
                           Constants.DrawerMenuIcon.fundTransfer,
                           Constants.DrawerMenuIcon.managePayee,
                           Constants.DrawerMenuIcon.eStatment]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tblMenuList.reloadData()
        }
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .accountOverview:
            
            let dashboardStoryboard = UIStoryboard(name:Constants.storyBoardName.dashboard, bundle: nil)
            let accountOverViewViewController = dashboardStoryboard.instantiateViewController(withIdentifier: "AccountOverViewViewController") as! AccountOverViewViewController
            self.accountOverViewViewController = UINavigationController(rootViewController: accountOverViewViewController)
            self.slideMenuController()?.changeMainViewController(self.accountOverViewViewController, close: true)
            
        case .fundTransfer:
            let dashboardStoryboard = UIStoryboard(name:Constants.storyBoardName.dashboard, bundle: nil)
            let fundTransferViewController = dashboardStoryboard.instantiateViewController(withIdentifier: "FundTransferViewController") as! FundTransferViewController
            self.fundTransferViewController = UINavigationController(rootViewController: fundTransferViewController)
            self.slideMenuController()?.changeMainViewController(self.fundTransferViewController, close: true)
            
        case .managePayee:
            let dashboardStoryboard = UIStoryboard(name:Constants.storyBoardName.dashboard, bundle: nil)
            let managePayeeViewController = dashboardStoryboard.instantiateViewController(withIdentifier: "ManagePayeeViewController") as! ManagePayeeViewController
            self.managePayeeViewController = UINavigationController(rootViewController: managePayeeViewController)
            self.slideMenuController()?.changeMainViewController(self.managePayeeViewController, close: true)
            
        case .eStatement:
            let dashboardStoryboard = UIStoryboard(name:Constants.storyBoardName.dashboard, bundle: nil)
            let eStatementViewController = dashboardStoryboard.instantiateViewController(withIdentifier: "EStatementViewController") as! EStatementViewController
            self.eStatementViewController = UINavigationController(rootViewController: eStatementViewController)
            self.slideMenuController()?.changeMainViewController(self.eStatementViewController, close: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCloseMenu(_ sender: Any) {
        tblMenuList.reloadData()
        self.slideMenuController()?.closeLeft()
    }
    
}

//  MARK:- TableView Delegate Methods
extension LeftViewController :
UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfmenus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftViewControllerCell", for: indexPath) as! LeftViewControllerCell
        cell.selectionStyle = .none
        cell.lblMenuList.text = arrOfmenus[indexPath.row]   //"Shree Swami Samarth"
        cell.imgIcon.image = UIImage(named:arrOfmenuImages[indexPath.row])
        tableView.allowsSelection = true
        cell.contentView.backgroundColor = UIColorFromRGB.init(rgb: AppColor.appPrimaryColor)
        if indexPath.row == 0 {
            cell.lblTopSeprator.isHidden = false
        }else{
            cell.lblTopSeprator.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColorFromRGB.init(rgb: AppColor.selectedCellOfLeftDrawer)
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
        let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath)!
        if cellToDeSelect.isEqual(LeftViewControllerCell()){
            cellToDeSelect.contentView.backgroundColor = UIColorFromRGB.init(rgb: AppColor.appPrimaryColor)
        }
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColorFromRGB.init(rgb: AppColor.selectedCellOfLeftDrawer)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
