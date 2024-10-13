//
//  SwiftDataExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//

import SwiftUI
import SwiftData

struct SwiftDataExample: View {
    
    @Environment(ApplicationData.self) private var appData
    @Environment(\.modelContext) var dbContext
//    @Query var listBooks: [MineBook]
    @Query(sort: [SortDescriptor(\MineBook.title, comparator: .lexical, order: .forward)]) private var listBooks: [MineBook]
    
    var body: some View {
        NavigationStack(path: Bindable(appData).viewPath) {
            List {
                ForEach(listBooks) { book in
                        MyBook(book: book)
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        dbContext.delete(listBooks[index])
                    }
                }
            }
            /*
            List(listBooks) { book in
                MyBook(book: book)
            }
             */
            .listStyle(.plain)
            .navigationTitle("Books")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(value: "Add Book", label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .navigationDestination(for: String.self, destination: { viewID in
                if viewID == "Add Book" {
                    AddBook()
                } else if viewID == "List Authors" {
                    ListAuthors()
                } else if viewID == "Add Author" {
                    AddAuthor()
                }
            })
        }
    }
}

struct MyBook: View {
   let book: MineBook

   var body: some View {
      HStack(alignment: .top) {
         Image(book.cover)
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 100)
         VStack(alignment: .leading, spacing: 2) {
            Text(book.title).bold()
            Text(book.author?.name ?? "Undefined")
            Text(book.displayYear).font(.caption)
            Spacer()
         }
         Spacer()
      }.padding([.top], 10)
   }
}

#Preview {
    SwiftDataExample()
        .environment(ApplicationData())
        .modelContainer(for: [MineBook.self], inMemory: true)
}
