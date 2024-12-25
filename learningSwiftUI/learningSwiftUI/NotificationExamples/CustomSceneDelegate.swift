//
//  CustomSceneDelegate.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.12.2024.
//
#if os(iOS)
import UIKit

class CustomSceneDelegate: NSObject, UIWindowSceneDelegate {
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       print("Scene was created")
    }
}
#endif
