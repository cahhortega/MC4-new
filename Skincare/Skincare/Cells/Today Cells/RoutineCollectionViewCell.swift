//
//  RoutineCollectionViewCell.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit

class RoutineCollectionViewCell: UICollectionViewCell {
    @IBOutlet var nameRoutine: UILabel!
    var circularView: UIView = CircularProgressBarView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
