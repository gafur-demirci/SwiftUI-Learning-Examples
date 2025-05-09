//
//  TodoApp.swift
//  Todo
//
//  Created by Abdulgafur Demirci on 4.05.2025.
//

import SwiftUI

@main
struct TodoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(selectedIconName: "Blue")
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(IconNames())
        }
    }
}
