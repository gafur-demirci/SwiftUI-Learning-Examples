//
//  Item.swift
//  Grocery List
//
//  Created by Abdulgafur Demirci on 10.04.2025.
//

import Foundation
import SwiftData

@Model
class Item {
    var name: String
    var isCompleted: Bool
    
    init(name: String, isCompleted: Bool) {
        self.name = name
        self.isCompleted = isCompleted
    }
}
