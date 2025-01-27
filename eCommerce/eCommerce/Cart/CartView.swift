//
//  CartView.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import SwiftUI

struct CartView: View {
//    @ObservedObject var userManager: UserManager
    
    var body: some View {
        VStack {
//            if let user = userManager.user {
//                let cartItems = userManager.fetchCartItems()
//                
//                if cartItems.isEmpty {
                    Text("Sepetiniz boş.")
//                } else {
//                    List(cartItems) { cartItem in
//                        VStack(alignment: .leading) {
//                            Text("Ürün: \(cartItem.product.name)")
//                            Text("Fiyat: \(cartItem.product.price) TL")
//                            Text("Miktar: \(cartItem.quantity)")
//                        }
//                    }
//                }
//            }
//        else {
//                Text("Kullanıcı yükleniyor...")
//            }
//            
//            Spacer()
        }
        .padding()
        .navigationTitle("Sepet")
    }
}
/*
 #Preview {
 CartView(userManager: UserManager())
 }
 */
