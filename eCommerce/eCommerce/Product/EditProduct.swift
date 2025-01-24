//
//  EditProduct.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 23.01.2025.
//

import SwiftUI

struct EditProduct: View {
    @Bindable var product: Product
    @Environment(ProductData.self) private var productData

    var body: some View {
        Form {
            TextField("Ürün Adı", text: $product.name)
            TextField("Fiyat", value: $product.price, format: .number)
            TextField("Açıklama", text: $product.desc)
            TextField("Resim URL", text: $product.imageUrl)
        }
        Button("Ürünü Sil") {
            if let index = productData.products.firstIndex(of: product) {
//                modelContext.delete(productData.products[index])
                productData.products.remove(at: index)
            }
        }
        .navigationTitle("Ürünü Düzenle")
    }
}

#Preview {
    EditProduct(product: Product(name: "Test", price: 10, desc: "Test", imageUrl: ""))
        .environment(ProductData())
}
