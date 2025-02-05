//
//  learningSwiftUIApp.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 28.04.2024.
//

import SwiftUI

@available(iOS 18.0, *)
@main
struct learningSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(ArtAppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared

    
    var body: some Scene {
        WindowGroup {
            FaceIdCheck()
        }
    }
}

