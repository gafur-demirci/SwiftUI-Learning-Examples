//
//  ContentView.swift
//  ToDoList
//
//  Created by Abdulgafur Demirci on 4.04.2025.
//

import SwiftUI
import SwiftData

struct AddToDoScreen: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var priority: Priority = .low
    private var isDone: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("To Do", text: $title)
                Picker("Priority", selection: $priority) {
                    Text("Low").tag(Priority.low)
                    Text("Medium").tag(Priority.medium)
                    Text("High").tag(Priority.high)
                }
                .pickerStyle(.menu)
            }
            .navigationTitle(Text("Add ToDo"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        saveToDo()
                    }, label: {
                        Text("Save")
                    })
                    .disabled(!isDone)
                })
            }
        }
    }

    func saveToDo() {
        
        guard !title.isEmpty else { return }
        
        let todo = ToDo(title: title, priority: priority)
        modelContext.insert(todo)
        
        do {
            try modelContext.save()
            print("saved")
        } catch {
            print("Error saving context: \(error.localizedDescription)")
        }
        dismiss()
    }
}

#Preview {
    AddToDoScreen()
        .modelContainer(for: [ToDo.self])
}
