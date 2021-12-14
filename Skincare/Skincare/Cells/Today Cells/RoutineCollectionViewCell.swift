//
//  RoutineCollectionViewCell.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit

class RoutineCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var morningCircularProgress: CircularProgressView!
    @IBOutlet weak var afternoonCircularProgress: CircularProgressView!
    @IBOutlet weak var nightCircularProgress: CircularProgressView!
    
    @IBOutlet var nameRoutine: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        morningCircularProgress.circleColor = UIColor(named: "Rosa")!
        morningCircularProgress.progressColor = UIColor.white
        afternoonCircularProgress.circleColor = UIColor(named: "Rosa")!
        afternoonCircularProgress.progressColor = UIColor.clear
        nightCircularProgress.circleColor = UIColor(named: "Rosa")!
        nightCircularProgress.progressColor = UIColor.clear
        // Initialization code
    }
//    @IBAction func btn60(_ sender: Any) {
//        circularProgress.setProgress(duration: 1.0, value: 0.60)
//
//    }


}
