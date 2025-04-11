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
    
    @State private var item: String = ""
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    Text(item.name)
                        .font(.title.weight(.light))
                        .padding(.vertical,2)
                        .foregroundStyle(item.isCompleted ? Color.accentColor : Color.primary)
                        .strikethrough(item.isCompleted)
                        .italic(item.isCompleted)
                        .swipeActions(content: {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(item)
                            }
                        })
                        .swipeActions(edge: .leading, content: {
                            Button("Done", systemImage: item.isCompleted ? "xmark.circle" : "checkmark.circle") {
                                item.isCompleted.toggle()
                            }
                            .tint(item.isCompleted ? Color.accentColor : Color.green)
                        })
                }
            }
            .navigationBarTitle("Grocery List")
//            .navigationBarItems(trailing: Button("Add") {
//                
//            })
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 12) {
                    TextField("Add item", text: $item)
                        .textFieldStyle(.plain)
                        .padding(12)
                        .background(.tertiary)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .font(.title.weight(.light))
                        .focused($isFocused)
                    Button {
                        withAnimation {
                            guard !item.isEmpty else { return }
                            modelContext.insert(GroceryItem(name: item, isCompleted: false))
                        }
                        item = ""
                        isFocused = false
                    } label: {
                        Text("Save")
                            .font(.title2.weight(.medium))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.extraLarge)
                }
                .padding()
                .background(.bar)
            }
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView(
                        "No items yet",
                        systemImage: "cart.circle",
                        description:
                            Text("Add some items to the shopping list.")
                    )
                }
            }
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
