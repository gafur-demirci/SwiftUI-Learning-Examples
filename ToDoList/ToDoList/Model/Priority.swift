//
//  Priority.swift
//  ToDoList
//
//  Created by Abdulgafur Demirci on 4.04.2025.
//

import Foundation

enum Priority: String, Codable, Comparable {
    static func < (lhs: Priority, rhs: Priority) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    case low = "Low"
    case medium = "Medium"
    case high = "High"
}
