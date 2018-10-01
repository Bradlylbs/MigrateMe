//
//  EnglishLevelTableViewCell.swift
//  MigrateMe
//
//  Created by bradlbs on 1/10/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class EnglishLevelTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var descriptionlabel: UILabel!
    
    @IBOutlet weak var singleswitch: UISwitch!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
