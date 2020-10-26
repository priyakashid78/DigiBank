//
//  SelectLanguageViewController.swift
//  DigiBank
//
//  Created by priya.kashid on 23/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class SelectLanguageViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var languageData = [String]()
    var rowsWhichAreChecked = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languageData = [Constants.languageString.english,Constants.languageString.hindi,Constants.languageString.marathi]
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LangCell", for: indexPath) as! LanguageTableViewCell
        cell.langTextField.text = languageData[indexPath.row]
       
        if(rowsWhichAreChecked.contains(indexPath.row) == false){
            cell.checkImage.isHidden = true
        }else{
            cell.checkImage.isHidden = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell:LanguageTableViewCell = tableView.cellForRow(at: indexPath) as! LanguageTableViewCell
        if(rowsWhichAreChecked.contains(indexPath.row) == false){
            cell.checkImage.isHidden = true
            rowsWhichAreChecked.removeAll()
            rowsWhichAreChecked.append(indexPath.row)
            tableView.reloadData()
        }else{
            cell.checkImage.isHidden = false
            if let checkedItemIndex = rowsWhichAreChecked.firstIndex(of: indexPath.row){
                rowsWhichAreChecked.remove(at: checkedItemIndex)
                tableView.reloadData()
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //MARK:- Ibaction
    
    @IBAction func goForward(_ sender: Any) {
          
        
       }
}
