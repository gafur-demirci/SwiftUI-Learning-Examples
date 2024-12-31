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
@available(iOS 18.0, *)
struct MultipleViewsExample: View {
    
    @Environment(ApplicationMyData.self) private var appData
    @State private var viewPath = NavigationPath()
    //    @State private var searchItem: String = ""
    //    @State private var searchScope: Scopes = .title
    //    @State private var searchTokens: [Tokens] = []
    @Namespace private var zoomBooks
    
    
    var body: some View {
        NavigationStack(path: Bindable(appData).viewPath, root: {
            List(appData.userData) { book in
                NavigationLink(value: book, label: {
                    BookView(book: book)
                        .matchedTransitionSource(id: book.id, in: zoomBooks)
                })
            }
            .navigationTitle(Text("Books"))
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    NavigationLink(value: "Settings View", label: {
                        Image(systemName: "gear")
                    })
                })
            }
            .navigationDestination(for: Book.self, destination: { book in
                DetailView(book: book)
                    .navigationTransition(.zoom(sourceID: book.id, in: zoomBooks))
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


struct BookView: View {
    
    @Environment(ApplicationMyData.self) private var appData
    let book: Book
    
    var body: some View {
        HStack(alignment: .top) {
            if(appData.showPicture) {
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80,height: 100)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(book.title)
                    .bold()
                Text(book.author)
                if(appData.showYear) {
                    Text(book.displayYear)
                        .font(.caption)
                }
                Spacer()
            }
            .padding(.top, 5)
            Spacer()
        }
    }
}

@available(iOS 18.0, *)
#Preview {
    MultipleViewsExample()
        .environment(ApplicationMyData.shared)
}
