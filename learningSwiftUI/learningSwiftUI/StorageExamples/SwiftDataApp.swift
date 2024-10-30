//
//  SwiftDataApp.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataApp: App {
    @State private var appData = ApplicationData()

    var body: some Scene {
        WindowGroup {
            SwiftDataExample()
                .environment(appData)
                .modelContainer(
                    for: [MineBook.self, Author.self], inMemory: true)
        }
    }
}
