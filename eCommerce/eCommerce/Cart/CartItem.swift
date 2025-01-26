//
//  Cart.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//
import Foundation
import SwiftData

@Model
class CartItem {
    @Attribute(.unique) var id: UUID
    var quantity: Int
    var product: Product
    var user: User
    
    init(quantity: Int, product: Product, user: User) {
        self.id = UUID()
        self.quantity = quantity
        self.product = product
        self.user = user
    }
}
