//
//  UniversalInterfaceExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 3.09.2024.
//

import SwiftUI

struct UniversalInterfaceExample: View {
    
    @Environment(ApplicationData.self) private var appData
    @State private var selectedBook: Book?
    @State private var visibility: NavigationSplitViewVisibility = .automatic
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility, sidebar: {
            BooksView(selectedBook: $selectedBook)
        }, detail: {
            if let book = selectedBook {
                DetailsView(book: book)
            }else {
                PlaceholderView()
            }
        })
        .onAppear {
            if let book = appData.userData.first {
                selectedBook = book
            }
        }
    }
}

#Preview {
    UniversalInterfaceExample()
        .environment(ApplicationData())
}
