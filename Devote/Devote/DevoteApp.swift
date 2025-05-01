//
//  DevoteApp.swift
//  Devote
//
//  Created by Abdulgafur Demirci on 1.05.2025.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
