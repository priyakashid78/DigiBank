//
//  LeftViewController.swift
//  ShopWIthTi
//
//  Created by JAYESH JOSHI on 16/10/20.
//  Copyright © 2020 JAYESH JOSHI. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
    case mychats = 0
    //case startyourchannel
    case discover
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController: UIViewController, LeftMenuProtocol {
    
    var arrOfmenus = [String]()
    var arrOfmenuImages = [String]()
    var teamViewController: UIViewController!
    var introducingChannelViewController: UIViewController!
    var supportViewController: UIViewController!
    
    @IBOutlet weak var tblMenuList: UITableView!
    @IBOutlet weak var imgProfile: UIImageView!
    
    
    
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
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.layer.borderWidth = 0.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tblMenuList.reloadData()
        }
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .mychats:
            
            let dashboardStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let accountOverViewViewController = dashboardStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.teamViewController = UINavigationController(rootViewController: accountOverViewViewController)
            self.slideMenuController()?.changeMainViewController(self.teamViewController, close: true)
            
        case .discover:
            let dashboardStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let accountOverViewViewController = dashboardStoryboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
            self.introducingChannelViewController = UINavigationController(rootViewController: accountOverViewViewController)
            self.slideMenuController()?.changeMainViewController(self.introducingChannelViewController, close: true)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnEditProfile(_ sender: Any) {
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftViewControllerCell", for: indexPath) as! LeftViewControllerCell
        cell.selectionStyle = .none
        cell.lblMenuList.text = "Shree Swami Samarth"
        tableView.allowsSelection = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
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
