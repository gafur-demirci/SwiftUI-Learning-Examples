//
//  CustomAppDelegate.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.12.2024.
//

import UIKit

class CustomAppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("App has launched")
        let appData = SingletonData.shared
        appData.maintext = "Text From Delegate"
        return true
    }
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: "Custom Delegate", sessionRole: connectingSceneSession.role)
        if connectingSceneSession.role == .windowApplication {
            config.delegateClass = CustomSceneDelegate.self
        }
        return config
    }
}
