//
//  Models.swift
//  TravelBook
//
//  Created by Abdulgafur Demirci on 28.01.2025.
//

import Foundation
import SwiftData

@Model
class User {
    @Attribute(.unique) var email: String
    var name: String
    var orders: [Order] = []
    
    init(email: String, name: String) {
        self.email = email
        self.name = name
    }
}

@Model
class Product {
    @Attribute(.unique) var sku: String
    var name: String
    var price: Double
    var orders: [Order] = []
    
    init(sku: String, name: String, price: Double) {
        self.sku = sku
        self.name = name
        self.price = price
    }
}

@Model
class Order {
    var id: UUID
    var date: Date
    @Relationship(deleteRule: .cascade) var user: User
    @Relationship(deleteRule: .cascade) var products: [Product] = []
    
    init(id: UUID = UUID(), date: Date = Date(), user: User) {
        self.id = id
        self.date = date
        self.user = user
    }
}
