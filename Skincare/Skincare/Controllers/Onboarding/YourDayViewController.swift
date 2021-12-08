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
    let dateFormatterHour = DateFormatter()
    let dateFormatterMin = DateFormatter()
    
    override func viewDidDisappear(_ animated: Bool) {
        //Pegando os valores dos pickers
        let morningHour = dateFormatterHour.string(from: pickerMorning.date)
        let morningMin = dateFormatterMin.string(from: pickerMorning.date)
        let afternoonHour = dateFormatterHour.string(from: pickerAfternoon.date)
        let afternoonMin = dateFormatterMin.string(from: pickerAfternoon.date)
        let nightHour = dateFormatterHour.string(from: pickerNight.date)
        let nightMin = dateFormatterMin.string(from: pickerNight.date)
        
        //Cadastrando os horários em UserDefaults
        UserDefaults.standard.setValue(Int(morningMin)!, forKey: "pickerMorningMin")
        UserDefaults.standard.setValue(Int(morningHour)!, forKey: "pickerMorningHour")

        UserDefaults.standard.setValue(Int(afternoonHour)!, forKey: "pickerAfternoonHour")
        UserDefaults.standard.setValue(Int(afternoonMin)!, forKey: "pickerAfternoonMin")

        UserDefaults.standard.setValue(Int(nightHour)!, forKey: "pickerNightHour")
        UserDefaults.standard.setValue(Int(nightMin)!, forKey: "pickerNightMin")

        
        print("manha:",UserDefaults.standard.string(forKey: "pickerMorningHour")!,UserDefaults.standard.string(forKey: "pickerMorningMin")!,"tarde:",UserDefaults.standard.string(forKey: "pickerAfternoonHour")!,UserDefaults.standard.string(forKey: "pickerAfternoonMin")!,"noite:",UserDefaults.standard.string(forKey: "pickerNightHour")!,UserDefaults.standard.string(forKey: "pickerNightMin")!)
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 1
        dateFormatterHour.dateFormat = "HH"
        dateFormatterMin.dateFormat = "mm"
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
