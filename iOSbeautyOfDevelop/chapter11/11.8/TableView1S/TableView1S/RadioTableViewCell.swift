//
//  RadioTableViewCell.swift
//  TableView1S
//
//  Created by aa64mac on 8/30/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

import UIKit

class RadioTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var mainTitleLabel: UILabel!
  
    @IBOutlet weak var subTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
