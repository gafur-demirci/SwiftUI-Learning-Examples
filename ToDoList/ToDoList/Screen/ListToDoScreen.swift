//
//  ListToDoScreen.swift
//  ToDoList
//
//  Created by Abdulgafur Demirci on 4.04.2025.
//

import SwiftUI
import SwiftData

struct ListToDoScreen: View {

    @Query(sort: \ToDo.createdAt, order: .reverse) private var todos: [ToDo]

    var body: some View {
        NavigationStack {
            ToDoList(todos: todos)
                .navigationTitle(Text("ToDo List"))
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        NavigationLink(destination: AddToDoScreen(), label: {
                            Text("Add ToDo")
                        })
                    })
                }
        }
    }
}

#Preview {
    ListToDoScreen()
        .modelContainer(for: [ToDo.self])
}
