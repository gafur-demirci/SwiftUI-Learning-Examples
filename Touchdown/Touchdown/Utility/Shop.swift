//
//  Shop.swift
//  Touchdown
//
//  Created by Abdulgafur Demirci on 1.05.2025.
//

import Foundation

class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? //= nil
}
