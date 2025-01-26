//
//  eCommerceApp.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 23.01.2025.
//

import SwiftUI
import SwiftData

struct ModelContainerKey: EnvironmentKey {
    static var defaultValue: ModelContainer? = nil
}

extension EnvironmentValues {
    var modelContainer: ModelContainer? {
        get { self[ModelContainerKey.self] }
        set { self[ModelContainerKey.self] = newValue }
    }
}

@main
struct eCommerceApp: App {
    
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.modelContainer, userManager.modelContainer)
        }
        .modelContainer(for: [Product.self])
    }
}
