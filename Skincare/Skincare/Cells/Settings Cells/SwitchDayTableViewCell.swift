//
//  SwitchDayTableViewCell.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit

class SwitchDayTableViewCell: UITableViewCell {
    @IBOutlet var labelDay: UILabel!
    @IBOutlet var switchDay: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
