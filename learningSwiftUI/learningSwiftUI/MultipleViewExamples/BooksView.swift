//
//  BooksView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 3.09.2024.
//

import SwiftUI

struct BooksView: View {
    @Environment(ApplicationMyData.self) private var appData
    @Binding var selectedBook: Book?
    let selectedAuthor: String?
    
    var listBooks: [Book] {
        let list = appData.userData.filter({ item in
            return item.author == selectedAuthor
        })
        return list.sorted(by: { $0.title < $1.title })
    }
    
    var body: some View {
        List(listBooks, selection: $selectedBook) { book in
            NavigationLink(value: book, label: {
                Text(book.title)
            })
        }
        .listStyle(.grouped)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(selectedAuthor ?? "Undefined")
        /*
        List(appData.userData, selection: $selectedBook) { book in
            NavigationLink(value: book, label: {
                Text(book.title)
            })
        }
        .listStyle(.sidebar)
        .navigationTitle("Books")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing, content: {
                NavigationLink(value: "Settings View", label: {
                    Image(systemName: "gear")
                })
                .isDetailLink(false)
            })
        }
        .navigationDestination(for: String.self, destination: { _ in
            SettingsView()
        })
        */
    }
}

#Preview {
    BooksView(selectedBook: .constant(nil), selectedAuthor: nil)
        .environment(ApplicationMyData())
}
