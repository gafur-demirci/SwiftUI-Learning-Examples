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
        /*
        NavigationStack {
            if(products.isEmpty){
                Text("Satın alınabilir ürün bulunmuyor.")
                NavigationLink(destination: AddProduct()) {
                    Text("Yeni Ürün Ekle")
                }
            } else {
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(products) { product in
                                NavigationLink(destination: EditProduct(product: product)) {
                                    ProductCard(product: product)
                                }
                                .buttonStyle(PlainButtonStyle()) // Kartın tasarımını bozmaz
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("Ürünler")
                }
                .toolbar {
                    ToolbarItem {
                        NavigationLink(destination: AddProduct()) {
                            Label("Add Product", systemImage: "plus")
                        }
                    }
                }
            }
        }
         */
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Product.self, inMemory: false)
}
