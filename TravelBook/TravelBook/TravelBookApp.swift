//
//  TravelBookApp.swift
//  TravelBook
//
//  Created by Abdulgafur Demirci on 19.01.2025.
//

import SwiftUI

@main
struct TravelBookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            mapView()
        }
    }
}
