//
//  SwiftDataApp.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//

import SwiftUI
import SwiftData

struct SwiftDataApp: App {
    @State private var appData = ApplicationMyData()

    var body: some Scene {
       WindowGroup {
          ContentView()
             .environment(appData)
             .modelContainer(for: [MineBook.self, Author.self])
       }
    }
}
