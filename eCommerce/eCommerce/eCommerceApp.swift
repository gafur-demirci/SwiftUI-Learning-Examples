//
//  eCommerceApp.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 23.01.2025.
//

import SwiftUI
import SwiftData

@main
struct eCommerceApp: App {
    
    @StateObject private var userSession = UserSessionManager()
    
    var body: some Scene {
        WindowGroup {
            Login()
                .environment(userSession)
                .modelContainer(for: [User.self, Product.self, CartItem.self]) // SwiftData için modeller
                .onAppear {
                }
        }
    }
}
