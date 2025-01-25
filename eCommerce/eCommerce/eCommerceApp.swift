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
//            ProductList()
            ContentView()
        }
        .modelContainer(for: [Product.self])
//        .environment(ProductData())
    }
}
