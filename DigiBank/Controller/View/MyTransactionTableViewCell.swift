//
//  MyTransactionTableViewCell.swift
//  DigiBank
//
//  Created by baban.jadhav on 29/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class MyTransactionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTransactionDate: UILabel!
    @IBOutlet weak var lblPayeeName: UILabel!
    @IBOutlet weak var lblTransactionType: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblPaymentId: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }    
   
}
