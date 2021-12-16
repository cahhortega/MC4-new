//
//  SceneDelegate.swift
//  Skincare
//
//  Created by Gabriele Namie on 26/11/21.
//

import UIKit
import UserNotifications

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var defaults = UserDefaults(suiteName: "group.by-dev.GabiNamie.Skincare")
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        NotificationManager.shared.registroLocalNotifications()
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(withIdentifier: UserDefaults(suiteName: "group.by-dev.GabiNamie.Skincare").string(forKey: NotificationPicker.MorningHour.rawValue) == nil ? "firstView" : "homeView")
        let navigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationController
        navigationController.navigationItem.backBarButtonItem?.tintColor = UIColor(named: "Rosa")
        /*
         identifiers
         tela forms = forms
         tela pele = type
         tela estante = shelf
         tela dia = day
         
         
         */
        
//        //Qual tela o app deve iniciar?
//        if defaults.string(forKey: "name") == nil {
//            print("tela nome")
//            setupScreens(identifier: "firstView")
//        } else if defaults.string(forKey: NotificationPicker.MorningHour.rawValue) == nil {
//            setupScreens(identifier: "day")
//            print ("tela pickers")
//
//        } else {
//            print("tela home")
//            setupScreens(identifier: "homeView")
//
//        }
//
    }
    
//    func setupScreens(identifier: String){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
//        let navigationController = UINavigationController(rootViewController: vc)
//        window?.rootViewController = navigationController
//        navigationController.navigationItem.backBarButtonItem?.tintColor = UIColor(named: "Rosa")
//    }

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
//        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

}

