//
//  NotificationManager.swift
//  Skincare
//
//  Created by Carolina Ortega on 09/12/21.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationManager()
    let center = UNUserNotificationCenter.current()
    var defaults = UserDefaults.standard
    
    
    private override init() {
        super.init()
        center.delegate = self
    }
    
    func registerCategories() {
        let show = UNNotificationAction(identifier: "show", title: "Vamos lá!", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
        center.setNotificationCategories([category])
    }
    
    @objc func registroLocalNotifications() {
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }
    
    func changeNotificationStatus(notificationId: NotificationIdentifier, isEnabled: Bool) {
        defaults.set(isEnabled, forKey: notificationId.rawValue)
        if isEnabled {
            registerNotification(identifier: notificationId)
        } else {
            self.center.removePendingNotificationRequests(withIdentifiers: [notificationId.rawValue])
            
        }
        
    }
    
    @objc func createLocalNotification(title: String, body: String, hour: Int, min: Int, identifier: String) {
        registerCategories()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.categoryIdentifier = NotificationCategory.Alarm.rawValue
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = min
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request) { error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // pull out the buried userInfo dictionary
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("Custom data received: \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                // the user swiped to unlock
                print("Default identifier")
                
            case "show":
                // the user tapped our "show more info…" button
                print("Show more information…")
                
            default:
                break
            }
        }
        completionHandler()
    }
    
    func registerNotification(identifier: NotificationIdentifier){
        switch (identifier) {
        case .Morning: createLocalNotification(title: "Bom dia, \(defaults.string(forKey: "name") ?? "")!",
                                               body: "Que tal começar o seu dia iniciando sua rotina de skincare?",
                                               hour: defaults.integer(forKey: NotificationPicker.MorningHour.rawValue),
                                               min: defaults.integer(forKey:NotificationPicker.MorningMin.rawValue),
                                               identifier: NotificationIdentifier.Morning.rawValue)
        case .Afternoon: createLocalNotification(title: "Boa tarde, \(defaults.string(forKey: "name") ?? "")!",
                                                 body: "qualquer coisa",
                                                 hour: defaults.integer(forKey: NotificationPicker.AfternoonHour.rawValue),
                                                 min: defaults.integer(forKey: NotificationPicker.AfternoonMin.rawValue),
                                                 identifier: NotificationIdentifier.Afternoon.rawValue)
        case .Night: createLocalNotification(title: "Boa noite, \(defaults.string(forKey: "name") ?? "")!",
                                             body: "Vamos finalizar o dia cuidando da sua pele?",
                                             hour: defaults.integer(forKey: NotificationPicker.NightHour.rawValue),
                                             min: defaults.integer(forKey: NotificationPicker.NightMin.rawValue),
                                             identifier: NotificationIdentifier.Night.rawValue)
        }
    }
}
