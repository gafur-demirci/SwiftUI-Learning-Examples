//
//  TravelBookApp.swift
//  TravelBook
//
//  Created by Abdulgafur Demirci on 19.01.2025.
//

import SwiftUI
import SwiftData

@main
struct TravelBookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [User.self, Product.self, Order.self])
//            mapView()
//                .environment(MapData())
        }
    }
}
