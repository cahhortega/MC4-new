//
//  SwitchDayTableViewCell.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit
import UserNotifications

class SwitchDayTableViewCell: UITableViewCell, UNUserNotificationCenterDelegate {
    @IBOutlet var labelDay: UILabel!
    @IBOutlet var switchDay: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UNUserNotificationCenter.current().delegate = self
        self.switchDay.addTarget(self, action: #selector(stateChanged(switchState:)), for: .valueChanged)
        // Initialization code
    }

    //Switch
    @objc func stateChanged(switchState: UISwitch) {
       if !switchState.isOn {
           let center = UNUserNotificationCenter.current()
           center.removePendingNotificationRequests(withIdentifiers: ["manha"])
           print("removi")
       } else {
           print("oi")
       }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
    //MARK: Delegates
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner,.sound])
    }


