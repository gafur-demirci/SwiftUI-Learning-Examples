//
//  MultipleViewsExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 10.08.2024.
//

import SwiftUI
/*
enum Scopes {
    case title, author
}

struct Tokens: Identifiable, Equatable {
    let id = UUID()
    let name: String
}
*/
struct MultipleViewsExample: View {
    
    @Environment(ApplicationData.self) private var appData
    @State private var viewPath = NavigationPath()
    //    @State private var searchItem: String = ""
    //    @State private var searchScope: Scopes = .title
    //    @State private var searchTokens: [Tokens] = []
    
    var body: some View {
        NavigationStack(path: Bindable(appData).viewPath, root: {
            List(appData.userData) { book in
                NavigationLink(value: book, label: {
                    BookView(book: book)
                })
            }
            .navigationTitle(Text("Books"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Book.self, destination: { book in
                DetailView(book: book)
            })
            .navigationDestination(for: String.self, destination: { viewID in
                if viewID == "Settings View" {
                    SettingsView()
                }else if viewID == "Picture View" {
                    PictureView()
                }
            })
        })
    }
}
/*
        //        NavigationStack(path: $viewPath) {
        /*
         List ( appData.userData) { book in
         NavigationLink(value: book, label: {
         BookView(book: book)
         })
         }
         //            SearchableView()
         .navigationTitle(Text("Books"))
         .navigationBarTitleDisplayMode(.inline)
         .toolbar {
         ToolbarItem(placement: .topBarTrailing, content: {
         NavigationLink(value: "Settings View", label: {
         Image(systemName: "gear")
         })
         })
         }
         .navigationDestination(for: Book.self, destination: { book in
         DetailView(viewPath: $viewPath, book: book)
         })
         .navigationDestination(for: String.self, destination: { viewId in
         if viewId == "Settings View" {
         SettingsView(viewPath: $viewPath)
         }
         })
         */
        /*
         .toolbar(content: {
         ToolbarItem(placement: .topBarTrailing) {
         NavigationLink(destination: SettingsView(), label: {
         Image(systemName: "gearshape")
         })
         }
         })
         */
        /*
         .toolbar {
         let list = appData.userData.map( {$0.author })
         let authors = Set(list).sorted()
         Menu(content: {
         ForEach(authors, id: \.self) { author in
         Button(author) {
         let token = Tokens(name: author)
         searchTokens = [token]
         }
         }
         }, label: {
         Image(systemName: "pencil.circle")
         })
         }
         */
        /*
         List(appData.filteredItems) { book in
         BookView(book: book)
         }.navigationTitle(Text("Books"))
         */
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

//        .searchable(text: $searchItem, tokens: $searchTokens, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Insert title"), token: { token in
//            Text(token.name)
//        })
//        .searchScopes($searchScope, scopes: {
//            Text("Title").tag(Scopes.title)
//            Text("Author").tag(Scopes.author)
//        })
//        .onChange(of: searchItem, initial: false) { _, _ in
//            performSearch()
//        }
//        .onChange(of: searchScope, initial: false) { _, _ in
//            performSearch()
//        }
//        .onChange(of: searchTokens, initial: false) { _, _ in
//            performSearch()
//        }
//        .searchSuggestions({
//            ForEach(appData.filteredItems) { item in
//                Text("\(item.title) - \(item.author)")
//                    .searchCompletion(item.title)
//            }
//        })
//        .onSubmit(of: .search) { performSearch()}
//        .onChange(of: searchItem, initial: false, { old, value in
////            if value.isEmpty {
////                performSearch()
////            }
//            let search = value.trimmingCharacters(in: .whitespaces)
//            appData.filterValues(search: search)
//        })
//    }
    
//    func performSearch() {
//        let search = searchItem.trimmingCharacters(in: .whitespaces)
////        appData.filterValues(search: search, scope: searchScope)
//        appData.filterValues(search: search, author: searchTokens.first?.name ?? "")
//    }
*/
/*
struct SearchableView: View {
    
    @Environment(ApplicationData.self) private var appData
    @Environment(\.isSearching) var isSearching
    @Environment(\.dismissSearch) var dismissSearch
    
    var body: some View {
        List {
            if isSearching {
                Button("Dismiss") {
                    dismissSearch()
                }
            }
            ForEach ( appData.filteredItems) { book in
                    BookView(book: book)
            }
        }
    }
}
*/

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
