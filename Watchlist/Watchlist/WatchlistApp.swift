//
//  WatchlistApp.swift
//  Watchlist
//
//  Created by Abdulgafur Demirci on 12.04.2025.
//

import SwiftUI
import SwiftData

@main
struct WatchlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}
