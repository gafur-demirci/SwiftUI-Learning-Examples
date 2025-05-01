//
//  AddToCartDetailView.swift
//  Touchdown
//
//  Created by Abdulgafur Demirci on 1.05.2025.
//

import SwiftUI

struct AddToCartDetailView: View {
    // MARK: - PROPERTY
    
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    
    var body: some View {
      Button(action: {
        feedback.impactOccurred()
      }, label: {
        Spacer()
        Text("Add to cart".uppercased())
          .font(.system(.title2, design: .rounded))
          .fontWeight(.bold)
          .foregroundColor(.white)
        Spacer()
      }) //: BUTTON
      .padding(15)
      .background(
        Color(
          red: shop.selectedProduct?.red ?? sampleProduct.red,
          green: shop.selectedProduct?.green ?? sampleProduct.green,
          blue: shop.selectedProduct?.blue ?? sampleProduct.blue
        )
      )
      .clipShape(Capsule())
    }
}

#Preview {
    AddToCartDetailView()
}
