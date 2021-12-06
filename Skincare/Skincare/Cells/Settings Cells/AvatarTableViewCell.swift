//
//  AvatarTableViewCell.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {
    @IBOutlet var girl1: UIImageView!
    @IBOutlet var girl2: UIImageView!
    @IBOutlet var girl3: UIImageView!
    @IBOutlet var girl4: UIImageView!
    @IBOutlet var girls: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
