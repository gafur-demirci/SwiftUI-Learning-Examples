//
//  ProductData.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 23.01.2025.
//

import Foundation
import SwiftData
import Observation

@Model
class Product: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    var name: String
    var price: Double
    var desc: String
    var imageUrl: String

    init(name: String, price: Double, desc: String, imageUrl: String) {
        self.id = UUID()
        self.name = name
        self.price = price
        self.desc = desc
        self.imageUrl = imageUrl
    }
}
