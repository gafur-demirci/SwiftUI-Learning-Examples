//
//  ToDoList.swift
//  ToDoList
//
//  Created by Abdulgafur Demirci on 4.04.2025.
//

import SwiftUI

struct ToDoList: View {

    var todos: [ToDo]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        List {
            ForEach(todos) { todo in
                NavigationLink(value: todo, label: {
                    HStack {
                        Text(todo.title)
                            .bold()
                        Spacer()
                        Text(todo.priority.rawValue)
                            .foregroundStyle(todo.priority == .high ? .red :
                                                todo.priority == .medium ? .blue : .yellow)
                    }
                })
            }
            .onDelete { offsets in
                offsets.forEach { index in
                    let toDo = self.todos[index]
                    deleteToDo(toDo)
                }
            }
        }
        .navigationDestination(for: ToDo.self) { todo in
            UpdateToDoScreen(toDo: todo)
        }
    }
    
    private func deleteToDo(_ toDo: ToDo) {
        modelContext.delete(toDo)
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ToDoList(todos: [ToDo(title: "Test", priority: .high)])
        .modelContainer(for: [ToDo.self])
}
