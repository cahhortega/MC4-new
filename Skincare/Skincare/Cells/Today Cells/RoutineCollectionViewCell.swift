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
        morningCircularProgress.circleColor = UIColor(named: "Bg")!
        morningCircularProgress.progressColor = UIColor(named: "Rosa")!
        morningCircularProgress.setProgress(duration: 1.0, value: 0.60)
        afternoonCircularProgress.circleColor = UIColor(named: "Bg")!
        afternoonCircularProgress.progressColor = UIColor(named: "Rosa")!
        afternoonCircularProgress.setProgress(duration: 1.0, value: 0.20)
        nightCircularProgress.circleColor = UIColor(named: "Bg")!
        nightCircularProgress.progressColor = UIColor(named: "Rosa")!
        nightCircularProgress.setProgress(duration: 1.0, value: 0.30)

        // Initialization code
    }
//    @IBAction func btn60(_ sender: Any) {
//        circularProgress.setProgress(duration: 1.0, value: 0.60)
//
//    }


}
