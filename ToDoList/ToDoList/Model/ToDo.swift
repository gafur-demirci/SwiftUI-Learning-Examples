//
//  ToDo.swift
//  ToDoList
//
//  Created by Abdulgafur Demirci on 4.04.2025.
//

import Foundation
import SwiftData

@Model
final class ToDo {

    var id = UUID()
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    var updatedAt: Date?
    var priority: Priority

    init(title: String, priority: Priority = .low) {
        self.title = title
        self.isCompleted = false
        self.createdAt = Date()
        self.updatedAt = nil
        self.priority = priority
    }
}
