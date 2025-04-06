//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Abdulgafur Demirci on 4.04.2025.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListToDoScreen()
            }
        }
        .modelContainer(for: [ToDo.self])
    }
}
