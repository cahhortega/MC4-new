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
    var defaults = UserDefaults.standard
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
        defaults.setValue(Int(morningMin)!, forKey: "pickerMorningMin")
        defaults.setValue(Int(morningHour)!, forKey: "pickerMorningHour")

        defaults.setValue(Int(afternoonHour)!, forKey: "pickerAfternoonHour")
        defaults.setValue(Int(afternoonMin)!, forKey: "pickerAfternoonMin")

        defaults.setValue(Int(nightHour)!, forKey: "pickerNightHour")
        defaults.setValue(Int(nightMin)!, forKey: "pickerNightMin")

        
        print("manha:",defaults.string(forKey: "pickerMorningHour")!,defaults.string(forKey: "pickerMorningMin")!,
              "tarde:",defaults.string(forKey: "pickerAfternoonHour")!,defaults.string(forKey: "pickerAfternoonMin")!,
              "noite:",defaults.string(forKey: "pickerNightHour")!,defaults.string(forKey: "pickerNightMin")!)
       
        //Configurando as notificações iniciais
        defaults.set(true, forKey: NotificationIdentifier.Morning.rawValue)
        defaults.set(true, forKey: NotificationIdentifier.Afternoon.rawValue)
        defaults.set(true, forKey: NotificationIdentifier.Night.rawValue)
        
        
        NotificationManager.shared.changeNotificationStatus(notificationId: .Morning, isEnabled: true)
        NotificationManager.shared.changeNotificationStatus(notificationId: .Afternoon, isEnabled: true)
        NotificationManager.shared.changeNotificationStatus(notificationId: .Night, isEnabled: true)


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
