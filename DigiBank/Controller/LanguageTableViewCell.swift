//
//  LanguageTableViewCell.swift
//  DigiBank
//
//  Created by priya.kashid on 26/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var langTextField: UILabel!
     @IBOutlet weak var checkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
