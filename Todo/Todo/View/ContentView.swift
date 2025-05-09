//
//  ContentView.swift
//  Todo
//
//  Created by Abdulgafur Demirci on 4.05.2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) private var managedObjectContext
    
    @FetchRequest(
        entity: Todo.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) private var todos: FetchedResults<Todo>
    
    @EnvironmentObject var iconSettings: IconNames
    
    @State private var showingAddTodoView = false
    @State private var showingSettingsView = false
    @State private var animatingButton: Bool = false
    @State var selectedIconName: String
    
    // MARK: - THEME
    
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
    
    // MARK: - APP ICON
    
    let currentIcon = UIApplication.shared.alternateIconName ?? "Blue"

    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(todos, id: \.self) { todo in
                        HStack {
                            Circle()
                                .frame(width: 12, height: 12, alignment: .center)
                                .foregroundStyle(self.colorize(priority: todo.priority ?? "Medium"))
                            
                            Text(todo.name ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(self.colorize(priority: todo.priority ?? "Medium"))
                            
                            Spacer()
                            
                            Text(todo.priority ?? "")
                                .font(.footnote)
                                .foregroundStyle(Color(UIColor.systemGray2))
                                .padding(3)
                                .frame(minWidth: 62)
                                .overlay(
                                    Capsule()
                                        .stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                                )
                        } //: HSTACK
                        .padding(.vertical, 10)
                    } //: FOREACH
                    .onDelete(perform: deleteItems)
                } //: LIST
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            self.showingSettingsView.toggle()
                        }, label: {
                            Image(systemName: "paintbrush")
                                .imageScale(.large)
                        })
                        .sheet(isPresented: $showingSettingsView, content: {
                            SettingsView(selectedIconName: currentIcon)
                                .environmentObject(self.iconSettings)
                        })
                    }
                } //: TOOLBAR
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                
                // MARK: - NO TODO ITEMS
                if todos.isEmpty {
                    EmptyListView()
                }
                
            } //: ZSTACK
            .sheet(isPresented: $showingAddTodoView, content: {
                AddTodoView()
                    .environment(\.managedObjectContext, self.managedObjectContext)
            })
            .overlay(
                ZStack {
                    Group {
                        Circle()
                            .fill(Color(themes[self.theme.themeSettings].themeColor))
                            .opacity(self.animatingButton ? 0.2 : 0)
                            .scaleEffect(self.animatingButton ? 1 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        Circle()
                            .fill(Color(themes[self.theme.themeSettings].themeColor))
                            .opacity(self.animatingButton ? 0.15 : 0)
                            .scaleEffect(self.animatingButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    }
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: self.animatingButton)
                    
                    Button(action: {
                        self.showingAddTodoView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(content: {
                                Circle()
                                    .fill(Color.colorBase)
                            })
                            .frame(width: 48, height: 48, alignment: .center)
                    }) //: BUTTON
                    .onAppear {
                        self.animatingButton.toggle()
                    }
                } //: ZSTACK
                    .padding(.bottom, 15)
                    .padding(.trailing, 15)
                , alignment: .bottomTrailing)
        } //: NAVIGATION
        .tint(Color(themes[self.theme.themeSettings].themeColor))
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            let currentIcon = UIApplication.shared.alternateIconName ?? "Blue"
            selectedIconName = currentIcon
        }
    }
    // MARK: - FUNCTIONS
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { todos[$0] }.forEach(managedObjectContext.delete)

            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    } //: deleteItems
    
    private func colorize(priority: String) -> Color {
        switch priority {
        case "High":
            return .pink
        case "Medium":
            return .green
        case "Low":
            return .blue
        default:
            return .gray
        }
    } //: colorize
}

#Preview {
    ContentView(selectedIconName: "Blue")
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
