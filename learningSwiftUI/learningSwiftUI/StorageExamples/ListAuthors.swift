//
//  ListAuthors.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//

import SwiftUI
import SwiftData

struct ListAuthors: View {
    @Environment(ApplicationMyData.self) private var appData
    @Query private var authorsList: [Author]
    @State private var selection: Author.ID? = nil

    var body: some View {
       List(authorsList, selection: $selection) { author in
          Text(author.name)
       }
       .onChange(of: selection, initial: false) { old, idAuthor in
          appData.selectedAuthor = authorsList.first(where: { $0.id == idAuthor })
          appData.viewPath.removeLast()
       }
       .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
             NavigationLink(value: "Add Author", label: {
                Image(systemName: "plus")
             })
          }
       }
    }
}

#Preview {
    NavigationStack {
       ListAuthors()
          .environment(ApplicationMyData())
          .modelContainer(for: [MineBook.self, Author.self], inMemory: true)
    }}
