//
//  TaskTableViewCell.swift
//  Skincare
//
//  Created by Carolina Ortega on 02/12/21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var titleTask: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
