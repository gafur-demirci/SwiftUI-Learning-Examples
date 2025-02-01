//
//  ProductList.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 23.01.2025.
//

import SwiftUI
import SwiftData

struct ProductList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var products: [Product]

    var body: some View {
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
    }
}

struct ProductCard: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Ürün Resmi
            AsyncImage(url: URL(string: product.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150) // Sabit boyut
                    .clipped()
            } placeholder: {
                Color.gray
                    .frame(width: 150, height: 150) // Sabit boyut
                    .overlay(Text("Yükleniyor...").foregroundColor(.white))
            }
            .cornerRadius(12)

            // Ürün Bilgileri
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)
                    .lineLimit(1)

                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(product.desc)
                    .font(.caption)
                    .lineLimit(2)
                    .foregroundColor(.gray)
            }
            .padding([.leading, .trailing, .bottom])
            VStack {
                Button(action: {
                    addChart(product: product)
                },label: {
                    Text("Sepete Ekle")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                })
                .padding()
            }
        }
        .frame(width: 160, height: 300) // Kartın genel boyutu
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
    
    func addChart(product: Product) {
        print("Sepete Eklendi: \(product.name)")
    }
}


#Preview {
    ProductList()
        .modelContainer(for: Product.self, inMemory: false)
}
