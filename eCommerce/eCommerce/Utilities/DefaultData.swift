struct DefaultData {
    static let users = [
        User(username: "admin", password: "admin123", userType: .admin),
        User(username: "seller1", password: "seller123", userType: .seller),
        User(username: "customer1", password: "customer123", userType: .customer)
    ]
    
    static let products = [
        Product(name: "Laptop", description: "High performance laptop", price: 1500.0),
        Product(name: "Smartphone", description: "Latest model smartphone", price: 800.0),
        Product(name: "Headphones", description: "Noise-canceling headphones", price: 150.0)
    ]
}
