//
//  EditProduct.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 23.01.2025.
//

import SwiftUI

struct EditProduct: View {
    @Bindable var product: Product
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var showAlert = false
    
    var body: some View {
        Form {
            Text("Ürün Detayları")
            TextField("Ürün Adı", text: $product.name)
            TextField("Fiyat", value: $product.price, format: .number)
                .keyboardType(.decimalPad)
            TextField("Açıklama", text: $product.desc)
            TextField("Resim URL", text: $product.imageUrl)
                .keyboardType(.URL)
            
            Button("Değişiklikleri Kaydet") {
                saveChanges()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .alert("Bu ürünü silmek istediğinize emin misiniz?", isPresented: $showAlert) {
            Button("Sil", role: .destructive) {
                deleteProduct(product)
            }
            Button("Vazgeç", role: .cancel) { }
        }
        Button("Ürünü Sil") {
            showAlert = true
        }
        .navigationTitle("Ürünü Düzenle")
    }
    
    private func deleteProduct(_ product: Product) {
        modelContext.delete(product)
        do {
            try modelContext.save()
            print("deleted")
        } catch {
            print("Ürün silinirken hata oluştu: \(error.localizedDescription)")
        }
    }
    
    private func saveChanges() {
        do {
            try modelContext.save() // Değişiklikleri kaydet
            dismiss() // Görünümü kapat
        } catch {
            print("Değişiklikler kaydedilemedi: \(error.localizedDescription)")
        }
    }
}

#Preview {
    EditProduct(product: Product(name: "Test", price: 10, desc: "Test", imageUrl: ""))
    //        .environment(ProductData())
}
