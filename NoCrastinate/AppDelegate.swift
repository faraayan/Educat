//
//  AppDelegate.swift
//  NoCrastinate
//
//  Created by Fara Yan on 10/27/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit

@UIApplicationMain
 class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        /*var vc: UIViewController
        if(UserDefaults.standard.value(forKey: "name") as? String) == nil{
            vc = storyboard.instantiateViewController(withIdentifier: "Introduction")
            print("did this")
            print(vc)
        }else{
            vc = storyboard.instantiateInitialViewController()!
            print("did that")
        }
        */
        self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "start")
        self.window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

