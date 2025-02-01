//
//  ECommerceApp.swift
//  TravelBook
//
//  Created by Abdulgafur Demirci on 28.01.2025.
//

import SwiftUI
import SwiftData

//@main
struct ECommerceApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [user, product1, order1])
        }
    }
}
