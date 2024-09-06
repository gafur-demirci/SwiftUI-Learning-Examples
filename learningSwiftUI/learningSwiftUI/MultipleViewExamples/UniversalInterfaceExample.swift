//
//  UniversalInterfaceExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 3.09.2024.
//

import SwiftUI

struct UniversalInterfaceExample: View {
    
//    @Environment(ApplicationData.self) private var appData
    @State private var selectedAuthor: String?
    @State private var selectedBook: Book?
//    @State private var path = NavigationPath()
    @State private var visibility: NavigationSplitViewVisibility = .automatic
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility, sidebar: {
            AuthorsView(selectedAuthor: $selectedAuthor)
        }, content: {
            BooksView(selectedBook: $selectedBook, selectedAuthor: selectedAuthor)
        },detail: {
//            NavigationStack(path: $path, root: {
            if let book = selectedBook {
                DetailsView(book: book)
            }else {
                PlaceholderView()
            }
//            })

        })
        .onChange(of: selectedBook, initial: false) { _, _ in
            visibility = .detailOnly
        }
//        .onChange(of: selectedBook, initial: false) { _, _ in
//            path = NavigationPath()
//        }
        /*
        .onAppear {
            if let book = appData.userData.first {
                selectedBook = book
            }
        }
        */
    }
}

#Preview {
    UniversalInterfaceExample()
        .environment(ApplicationData())
}
