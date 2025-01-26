//
//  AddProduct.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 23.01.2025.
//

import SwiftUI
import SwiftData

struct AddProduct: View {
    @Environment(\.modelContext) private var modelContext

    @State private var name: String = ""
    @State private var price: String = ""
    @State private var description: String = ""
    @State private var imageUrl: String = ""

    var body: some View {
        VStack {
            TextField("Ürün Adı", text: $name)
                .textFieldStyle(.roundedBorder)
            TextField("Fiyat", text: $price)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            TextField("Açıklama", text: $description)
                .textFieldStyle(.roundedBorder)
            TextField("Resim URL", text: $imageUrl)
                .textFieldStyle(.roundedBorder)
            
            Button("Ürünü Ekle") {
                if let priceValue = Double(price) {
                    let newProduct = Product(name: name, price: priceValue, desc: description, imageUrl: imageUrl)
                    modelContext.insert(newProduct)
                    do {
                        try modelContext.save()
                        print("Saved!")
                    } catch {
                        print("Veriler kaydedilemedi: \(error.localizedDescription)")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
    }
}

#Preview {
    AddProduct()
        .modelContainer(for: Product.self, inMemory: false)
}
