//
//  MultipleViewsExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 10.08.2024.
//

import SwiftUI

struct MultipleViewsExample: View {
    
    @Environment(ApplicationData.self) private var appData
    var body: some View {
        NavigationStack {
            ScrollViewReader(content: { proxy in
                List(appData.userData) { book in
                    BookView(book: book)
                        .id(book.id)
                }
                .listStyle(.plain)
                .navigationTitle(Text("Books"))
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
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
                    
                    /*
                     ToolbarItem(placement: .topBarTrailing, content: {
                     Button(action: {
                     print("Delete Item")
                     }, label: {
                     Image(systemName: "trash")
                     })
                     })
                     */
                }
            })
        }
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
