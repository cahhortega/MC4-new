//
//  SceneDelegate.swift
//  Skincare
//
//  Created by Gabriele Namie on 26/11/21.
//

import UIKit
import UserNotifications

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UNUserNotificationCenterDelegate {

    var defaults = UserDefaults.standard
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        registroLocalNotifications()
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: UserDefaults.standard.string(forKey: "name") == nil ? "firstView" : "homeView")
        let navigationController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        navigationController.navigationItem.backBarButtonItem?.tintColor = UIColor(named: "Rosa")

        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        localNotification(title: "Bom dia, \(defaults.string(forKey: "name") ?? "")!",
                          body: "Que tal começar o seu dia iniciando sua rotina de skincare?",
                          hour: defaults.integer(forKey: "pickerMorningHour"),
                          min: defaults.integer(forKey: "pickerMorningMin"),
                          identifier: "manha")
//        localNotification(title: "Boa tarde, \(defaults.string(forKey: "name") ?? "")!",
//                          body: "qualquer coisa",
//                          hour: defaults.integer(forKey: "pickerAfternoonHour"),
//                          min: defaults.integer(forKey: "pickerAfternoonMin"),
//                          identifier: "tarde")
//        localNotification(title: "Boa noite, \(defaults.string(forKey: "name") ?? "")!",
//                          body: "qualquer coisa",
//                          hour: defaults.integer(forKey: "pickerNightHour"),
//                          min: defaults.integer(forKey: "pickerNightMin"),
//                          identifier: "noite")
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

    @objc func registroLocalNotifications() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }
    @objc func localNotification(title: String, body: String, hour: Int, min: Int, identifier: String) {
        registerCategories()
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = min

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request)
    }
    
    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "Vamos lá!", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
        
        center.setNotificationCategories([category])
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

}
////Create the request
//let request = UNNotificationRequest(
//    identifier: "my.notification",
//    content: content,
//    trigger: trigger
//)
////Schedule the request
//UNUserNotificationCenter.current().add(
//    request, withCompletionHandler: nil)
