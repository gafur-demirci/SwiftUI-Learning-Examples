//
//  AddTodoView.swift
//  Todo
//
//  Created by Abdulgafur Demirci on 4.05.2025.
//

import SwiftUI
import CoreData

struct AddTodoView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    let priorities = ["High", "Medium", "Low"]
    
    @State private var title: String = ""
    @State private var priority: String = "Medium"
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    // MARK: - THEME
    
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    // MARK: - TODO NAME
                    TextField("Todo", text: $title)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                        .font(.system(size: 24, weight: .bold, design: .default))
                    
                    // MARK: - TODO PRIORTY
                    Picker("Priority", selection: $priority, content: {
                        ForEach(priorities, id: \.self) { priority in
                            Text(priority)
                        }
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // MARK: - SAVE BUTTON
                    Button(action: {
                        if self.title.isEmpty {
                            self.errorShowing = true
                            self.errorTitle = "Invalid Name"
                            self.errorMessage = "Make sure to enter something for\nthe new todo item."
                            return
                        } else {
                            // ADD TODO
                            let todo = Todo(context: managedObjectContext)
                            todo.name = self.title
                            todo.priority = self.priority
                            
                            do {
                                try managedObjectContext.save()
                                print("Todo saved successfully! \(todo.name ?? "") - \(todo.priority ?? "")")
                            } catch {
                                print("Error saving managed object context: \(error)")
                            }
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Save")
                        
                        // TODO: Buton üzerine uygulandığında aynı görünümü veriyor ama tıklama sadece yazı kısmına oluyor diğer kısımlar clicked olarak çalışmıyor, nedeni araştırılacak. Text'e verince o büyüyor ve clickable olarak çalışıyor.
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color(themes[self.theme.themeSettings].themeColor))
                            .clipShape(RoundedRectangle(cornerRadius: 9))
                            .foregroundStyle(.white)
                    })
                } //: VSTACK
                .padding(.horizontal)
                .padding(.vertical, 30)
                Spacer()
            } //: VSTACK
            .navigationTitle(Text("New Todo"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                })
            })
//            .alert("Error", isPresented: $errorShowing, actions: {
//                Alert(title: Text(self.errorTitle), message: Text(self.errorMessage), dismissButton: .default(Text("OK")))
//            })
            .alert(self.errorTitle, isPresented: $errorShowing) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(self.errorMessage)
            }
        } //: NAVIGATION
        .tint(Color(themes[self.theme.themeSettings].themeColor))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    AddTodoView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
