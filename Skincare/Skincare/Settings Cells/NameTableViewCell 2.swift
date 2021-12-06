//
//  NameTableViewCell.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    @IBOutlet var labelName: UILabel!
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.name.isUserInteractionEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
