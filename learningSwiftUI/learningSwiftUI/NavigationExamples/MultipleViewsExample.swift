//
//  MultipleViewsExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 10.08.2024.
//

import SwiftUI

struct MultipleViewsExample: View {
    
    @Environment(ApplicationData.self) private var appData
    @State private var searchItem: String = ""
    
    var body: some View {
        NavigationStack {
            List(appData.filteredItems) { book in
                CellBook(book: book)
            }.navigationTitle(Text("Books"))
            /*
            ScrollViewReader(content: { proxy in
                List(appData.userData) { book in
                    BookView(book: book)
                        .id(book.id)
                }
                .listStyle(.plain)
                .navigationTitle(Text("Books"))
                .navigationBarTitleDisplayMode(.automatic)
                //                .toolbar(.hidden, for: .navigationBar)
                .toolbar {
                    Menu(content: {
                        Button("Option 1") { print("Option 1")}
                        Button("Option 2") { print("Option 2")}
                        Button("Option 3") { print("Option 3")}
                    }, label: {
                        Image(systemName: "filemenu.and.selection")
                    })
                }
                /*
                .toolbar(id: "mybar") {
                    ToolbarItem(id: "sort", placement: .secondaryAction, content: {
                        Button(action: {
                            print("Sorting books...")
                        }, label: {
                            Label("Sort Books", systemImage: "arrow.up.arrow.down")
                        })
                    })
                    ToolbarItem(id: "settings", placement: .secondaryAction, content: {
                        Button(action: {
                            print("Settings...")
                        }, label: {
                            Label("Settings", systemImage: "gearshape")
                        })
                    })
                    
                    /*
                    ToolbarItemGroup(placement: .primaryAction, content: {
                        Button(action: {
                            print("Adding book...")
                        }, label: {
                            Image(systemName: "plus.app")
                        })
                    })
                    ToolbarItemGroup(placement: .secondaryAction, content: {
                        Button(action: {
                            print("Sorting Book...")
                        }, label: {
                            Label("Sort Books", systemImage: "arrow.up.arrow.down")
                        })
                    })
                     */
                }
                .toolbarRole(.editor)
                */
                /*
                 ToolbarItem(placement: .bottomBar, content: {
                 HStack(content: {
                 Button("Show") {
                 print("Show Values")
                 }
                 })
                 .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                 })
                 */
                /*
                 ToolbarItemGroup(placement: .topBarTrailing, content: {
                 Button(action: {
                 if let firstIndex = appData.userData.first?.id {
                 proxy.scrollTo(firstIndex, anchor: .bottom)
                 }
                 }, label: {
                 Image(systemName: "arrow.up.doc")
                 })
                 Button(action: {
                 if let lastIndex = appData.userData.last?.id {
                 proxy.scrollTo(lastIndex, anchor: .top)
                 }
                 }, label: {
                 Image(systemName: "arrow.down.doc")
                 })
                 })
                 */
                /*
                 ToolbarItem(placement: .topBarTrailing, content: {
                 Button(action: {
                 print("Delete Item")
                 }, label: {
                 Image(systemName: "trash")
                 })
                 })
                 */
            })
            */
        }
        .searchable(text: $searchItem, prompt: Text("Insert title"))
        .onChange(of: searchItem, initial: false, { old, value in
            let search = value.trimmingCharacters(in: .whitespaces)
            appData.filterValues(search: search)
        })
    }
}

struct BookView: View {
    let book: Book
    
    var body: some View {
        HStack(alignment: .top) {
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 100)
            VStack(alignment: .leading, spacing: 2) {
                Text(book.title)
                    .bold()
                Text(book.author)
                Text(book.displayYear)
                    .font(.caption)
                Spacer()
            }
            .padding(.top, 5)
            Spacer()
        }
    }
}

#Preview {
    MultipleViewsExample()
        .environment(ApplicationData())
}
