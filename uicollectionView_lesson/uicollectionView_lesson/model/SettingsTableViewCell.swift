//
//  SettingsTableViewCell.swift
//  uicollectionView_lesson
//
//  Created by Alexander Penkov on 19.01.2020.
//  Copyright © 2020 Alexander Penkov. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var titleSettingsCell: UILabel!
    
    @IBOutlet weak var switchSettingsOutlet: UISwitch!
    
}
