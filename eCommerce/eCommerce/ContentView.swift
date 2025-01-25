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
    @Query private var items: [Product]

    var body: some View {
        NavigationStack {
            if(items.isEmpty){
                Text("Satın alınabilir ürün bulunmuyor.")
                NavigationLink(destination: AddProduct()) {
                    Text("Yeni Ürün Ekle")
                }
            } else {
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            Text("Product at \(item.name)")
                            Text(String(item.price))
                        } label: {
                            Text(item.name)
                        }
                    }
                    .onDelete(perform: deleteProducts)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addProduct) {
                            Label("Add Product", systemImage: "plus")
                        }
                    }
                }
            }
        }
    }

    private func addProduct() {
        withAnimation {
            let newProduct = Product(name: "Test Product", price: 12.99, desc: "Test product description", imageUrl: "")
            modelContext.insert(newProduct)
        }
    }

    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Product.self, inMemory: true)
}
