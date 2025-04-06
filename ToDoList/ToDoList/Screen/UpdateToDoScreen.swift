//
//  UpdateToDoScreen.swift
//  ToDoList
//
//  Created by Abdulgafur Demirci on 6.04.2025.
//

import SwiftUI

struct UpdateToDoScreen: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var priority: Priority = .low
    
    let toDo: ToDo
    
    var body: some View {
        Form {
            TextField("To Do", text: $title)
            Picker("Priority", selection: $priority) {
                Text("Low").tag(Priority.low)
                Text("Medium").tag(Priority.medium)
                Text("High").tag(Priority.high)
            }
            .pickerStyle(.menu)
        }
        .onAppear {
            title = toDo.title
            priority = toDo.priority
        }
        Spacer()
        Button("Update") {
            updateToDo()
        }
    }
    
    private func updateToDo() {
        toDo.title = title
        toDo.priority = priority
        toDo.updatedAt = Date()
        
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
        dismiss()
    }
}

#Preview {
    UpdateToDoScreen(toDo: ToDo(title: "Test", priority: .high))
}
