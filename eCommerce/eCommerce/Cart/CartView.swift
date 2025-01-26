//
//  CartView.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Sepetiniz Boş")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()

                Spacer()
            }
            .navigationTitle("Sepet")
        }
    }
}

#Preview {
    CartView()
}
