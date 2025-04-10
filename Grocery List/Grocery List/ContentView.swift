//
//  ContentView.swift
//  Grocery List
//
//  Created by Abdulgafur Demirci on 10.04.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [GroceryItem]
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
    }
}


#Preview("Sample Data") {
    let sampleData: [GroceryItem] = [
        GroceryItem(name: "Bakery & Bread", isCompleted: false),
        GroceryItem(name: "Meat & Seafood", isCompleted: true),
        GroceryItem(name: "Cereals", isCompleted: .random()),
        GroceryItem(name: "Pasta & Rice", isCompleted: .random()),
        GroceryItem(name: "Cheese & Eggs", isCompleted: .random())
    ]
    let container = try! ModelContainer(for: GroceryItem.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for item in sampleData {
        container.mainContext.insert(item)
    }

    return ContentView()
        .modelContainer(container)
}


#Preview("Empty List") {
    ContentView()
        .modelContainer(for: GroceryItem.self, inMemory: true)
}
