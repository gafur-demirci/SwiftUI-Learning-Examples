//
//  ProductList.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 23.01.2025.
//

import SwiftUI
import SwiftData

struct ProductList: View {
    @Environment(ProductData.self) private var productData
    
    var body: some View {
        NavigationStack {
            if(!productData.products.isEmpty) {
                List {
                    ForEach(productData.products, id: \.self) { product in
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.headline)
                            Text("$\(product.price, specifier: "%.2f")")
                                .font(.subheadline)
                            Text(product.desc)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    .navigationTitle("Ürünler")
                }
            } else {
                Text("Ürün Listesi Boş")
                Spacer()
                NavigationLink (destination: ContentView()) {
                    Text("Ürün Ekle")
                }
            }
        }
    }
}

#Preview {
    ProductList()
        .environment(ProductData())
}
