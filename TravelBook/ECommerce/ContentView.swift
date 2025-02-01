//
//  ContentView.swift
//  TravelBook
//
//  Created by Abdulgafur Demirci on 28.01.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]
    @Query private var products: [Product]
    
    var body: some View {
        VStack {
            Button("Add Sample Data") {
                let user = User(email: "john.doe@example.com", name: "John Doe")
                let product1 = Product(sku: "P001", name: "Laptop", price: 1200.0)
                let product2 = Product(sku: "P002", name: "Mouse", price: 50.0)
                let order = Order(user: user)
                order.products.append(product1)
                order.products.append(product2)
                
                modelContext.insert(user)
                modelContext.insert(product1)
                modelContext.insert(product2)
                modelContext.insert(order)
                
                try? modelContext.save()
            }
            
            List(users) { user in
                Section(header: Text(user.name)) {
                    ForEach(user.orders) { order in
                        VStack(alignment: .leading) {
                            Text("Order ID: \(order.id.uuidString)")
                            Text("Date: \(order.date.formatted())")
                            ForEach(order.products) { product in
                                Text("Product: \(product.name) - $\(product.price, specifier: "%.2f")")
                            }
                        }
                    }
                }
            }
        }
    }
}
