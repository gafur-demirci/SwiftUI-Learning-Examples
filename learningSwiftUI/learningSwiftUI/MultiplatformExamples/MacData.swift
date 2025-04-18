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
        foodList = ["bagels", "brownies", "butter", "cheese", "coffee", "cookies", "donuts", "granola", "juice", "lemonade", "lettuce", "milk", "oatmeal", "potato", "tomato", "yogurt"]
    }
}
