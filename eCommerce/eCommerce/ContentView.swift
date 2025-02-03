//
//  ContentView.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 23.01.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var products: [Product]

    var body: some View {
        TabView {
            ProductList()
                .tabItem {
                    Label("Anasayfa", systemImage: "house.fill")
                }
            
            CartView()
                .tabItem {
                    Label("Sepet", systemImage: "cart.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Product.self, inMemory: false)
}
