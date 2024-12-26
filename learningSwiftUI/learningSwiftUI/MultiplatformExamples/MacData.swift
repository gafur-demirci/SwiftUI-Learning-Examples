//
//  MacData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 25.12.2024.
//

import SwiftUI
import Observation

struct AddressKey: FocusedValueKey {
    typealias Value = String
}

extension FocusedValues {
    var address: AddressKey.Value? {
        get { self[AddressKey.self] }
        set { self[AddressKey.self] = newValue }
    }
}

@Observable class MacData {
    var selectedOption: Int = 1
    var inputMessage: String = ""
    var inputAddress: String = ""
    var foodList: [String]
    
    init() {
        foodList = ["Pizza", "Pasta", "Salad","Steak","Chicken","Fish","Bread","Dessert","Snacks","Fruits","Vegetables","Beverages","Coffee","Tea","Juice"]
    }
}
