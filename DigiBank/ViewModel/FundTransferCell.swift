//
//  FundTransferCell.swift
//  DigiBank
//
//  Created by priya.kashid on 28/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class FundTransferCell: UITableViewCell {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var buttonImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var backView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
