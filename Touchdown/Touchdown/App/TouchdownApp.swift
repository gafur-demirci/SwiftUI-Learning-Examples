//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Abdulgafur Demirci on 27.04.2025.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
