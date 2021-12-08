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
    @IBOutlet weak var progressView: UIProgressView!
    
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
        progressView.progress = 1
        dateFormatter.dateFormat = "HH"
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Rosa")

        //navigationBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Anterior",
            style: .plain,
            target: self,
            action: #selector(back)
        )
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Rosa")


    }
    
    //Ação do backButton
    @objc func back(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "shelf") as! ShelfFormViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }

    
    
    
}
