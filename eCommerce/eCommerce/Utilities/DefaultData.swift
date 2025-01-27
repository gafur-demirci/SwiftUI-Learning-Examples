//
//  DefaultData.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//


struct DefaultData {
    static let users = [
        User(username: "admin", password: "admin123", userType: .admin),
        User(username: "seller1", password: "seller123", userType: .seller),
        User(username: "customer1", password: "customer123", userType: .customer)
    ]
    
    static let products = [
        Product(name: "Laptop", price: 1500.0, desc: "High performance laptop",  imageUrl: "laptop"),
        Product(name: "Smartphone", price: 800.0, desc: "Latest model smartphone",  imageUrl: "smartphone"),
        Product(name: "Headphones", price: 150.0, desc: "Noise-canceling headphones",  imageUrl: "headphones")
    ]
}
