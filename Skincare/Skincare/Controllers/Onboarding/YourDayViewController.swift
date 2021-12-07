//
//  YourDayViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 30/11/21.
//

import UIKit

class YourDayViewController: UIViewController {
    @IBOutlet var pickerMorning: UIDatePicker!
    @IBOutlet var pickerAfternoon: UIDatePicker!
    @IBOutlet var pickerNight: UIDatePicker!
    
    // Create Date Formatter
    let dateFormatter = DateFormatter()

    override func viewDidDisappear(_ animated: Bool) {
        let morning = dateFormatter.string(from: pickerMorning.date)
        let afternoon = dateFormatter.string(from: pickerAfternoon.date)
        let night = dateFormatter.string(from: pickerNight.date)
        UserDefaults.standard.setValue(Int(morning)!, forKey: "pickerMorning")
        UserDefaults.standard.setValue(Int(afternoon)!, forKey: "pickerAfternoon")
        UserDefaults.standard.setValue(Int(night)!, forKey: "pickerNight")
        
        print("manha:",Int(morning)!, "tarde:", Int(afternoon)!, "noite:", Int(night)!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "HH"


        navigationController?.setNavigationBarHidden(false, animated: false)
        
        
        // Do any additional setup after loading the view.
    }
    
    
}
