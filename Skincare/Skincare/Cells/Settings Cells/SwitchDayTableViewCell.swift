//
//  SwitchDayTableViewCell.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit
import UserNotifications

class SwitchDayTableViewCell: UITableViewCell {
    @IBOutlet var labelDay: UILabel!
    @IBOutlet var switchDay: UISwitch!
    var notificationId: NotificationIdentifier = .Morning
    var defaults = UserDefaults(suiteName: "group.by-dev.GabiNamie.Skincare")
    
    
    func setup(notificationId: NotificationIdentifier){
        self.notificationId = notificationId
        switchDay.isOn = defaults?.bool(forKey: notificationId.rawValue) ?? false
        switch notificationId {
        case .Morning:
            labelDay.text = "Manhã"
        case .Afternoon:
            labelDay.text = "Tarde"
        case .Night:
            labelDay.text = "Noite"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //        UNUserNotificationCenter.current().delegate = self
        self.switchDay.addTarget(self, action: #selector(stateChanged(switchState:)), for: .valueChanged)
        // Initialization code
    }
    
    //Switch
    @objc func stateChanged(switchState: UISwitch) {
        NotificationManager.shared.changeNotificationStatus(notificationId: self.notificationId, isEnabled: switchState.isOn)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}



