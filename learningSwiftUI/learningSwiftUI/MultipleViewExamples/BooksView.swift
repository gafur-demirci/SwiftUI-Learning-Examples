//
//  BooksView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 3.09.2024.
//

import SwiftUI

struct BooksView: View {
    @Environment(ApplicationData.self) private var appData
    @Binding var selectedBook: Book?
    
    var body: some View {
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
    }
}

#Preview {
    BooksView(selectedBook: .constant(nil))
        .environment(ApplicationData())
}
