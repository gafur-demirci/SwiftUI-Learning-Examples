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
//    @Query(sort: [SortDescriptor(\MineBook.title, comparator: .lexical, order: .forward)]) private var listBooks: [MineBook]
//    @Query(filter: #Predicate<MineBook> { $0.year == 1986 }) private var listBooks: [MineBook]
//    @Query(filter: #Predicate<MineBook> { $0.author?.name.localizedStandardContains("Stephen") == true }) private var listBooks: [MineBook]
    @State private var orderBooks: SortOrder = .forward
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack(path: Bindable(appData).viewPath) {
            ListBooksView(orderBooks: orderBooks, search: searchText)
                .listStyle(.plain)
                .navigationTitle("Books")
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            orderBooks = orderBooks == .forward ? .reverse : .forward
                        }, label: {
                            Image(systemName: "gear")
                        })
                    }
                    ToolbarItem(placement: .topBarTrailing, content: {
                        NavigationLink(value: "Add Book", label: {
                            Image(systemName: "plus")
                        })
                    })
                }
                .navigationDestination(for: String.self, destination: { viewID in
                    if viewID == "Add Book" {
                        AddBook()
                    } else if  viewID == "List Authors" {
                        ListAuthors()
                    } else if viewID == "Add Author" {
                        AddAuthor()
                    }
                })
                .onAppear {
                    let predicate = #Predicate<MineBook> { book in
                        book.author?.name == nil
                    }
                    let sort = SortDescriptor<MineBook>(\.title, order: orderBooks)
                    
                    let descriptor = FetchDescriptor<MineBook>(predicate: predicate, sortBy: [sort])
                    
                    if let count = try? dbContext.fetchCount(descriptor) {
                        print(count)
                    }
                    
//                    if let list = try? dbContext.fetch(descriptor) {
//                        for book in list {
//                            print(book.title)
//                        }
//                    }
                }
        }
        .searchable(text: $searchText, prompt: Text("Search"))
        /*
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
        */
    }
}

struct ListBooksView: View {
    @Query var books: [MineBook]
    
    init(orderBooks: SortOrder, search: String) {
        var predicate = #Predicate<MineBook> { _ in true }
        if (!search.isEmpty) {
            let searchLower = search.lowercased()
            predicate = #Predicate<MineBook> { book in
                book.title.localizedStandardContains(searchLower ?? "")
            }
        }
        _books = Query<MineBook, [MineBook]>(filter: predicate, sort: \MineBook.title, order: orderBooks)
    }
    
    var body: some View {
        List {
            ForEach(books) { book in
                MyBook(book: book)
            }
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
