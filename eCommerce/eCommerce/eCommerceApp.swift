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
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            Login()
                .modelContainer(for: [User.self, Product.self, CartItem.self]) // SwiftData için modeller
                .onAppear {
                }
        }
    }
}
