//
//  BookDetailView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 16.11.2024.
//

import SwiftUI

struct BookDetailView: View {
    
    @Environment(ApplicationData.self) private var appData
    let book: MineBook
    
    var body: some View {
        VStack {
            Text(book.title)
                .font(.title)
            Text(book.author?.name ?? "Unknown")
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            Spacer()
        }
        .padding()
        .navigationTitle(Text("Book"))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    appData.selectedBook = book
                    appData.selectedAuthor = book.author
                    appData.viewPath.append("Add Book")
                }, label: {
                    Image(systemName: "pencil.circle")
                })
            }
        }
    }
}

#Preview {
    NavigationStack {
        BookDetailView(book: PreviewContainer.sample)
            .environment(ApplicationData())
            .modelContainer(PreviewContainer.container)
    }
    
}
