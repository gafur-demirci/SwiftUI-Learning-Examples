//
//  PreviewContainer.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 2.11.2024.
//

import SwiftUI
import SwiftData

class PreviewContainer {
    @MainActor
    static let container: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: MineBook.self, Author.self, configurations: config)
            
            let author = Author(name: "Stephen King", books: [])
            container.mainContext.insert(author)
            
            let book1 = MineBook(title: "The Shining", author: author, cover: "nocover", year: 1977)
            container.mainContext.insert(book1)
            
            let book2 = MineBook(title: "The Dark Tower", author: author, cover: "nocover", year: 1973)
            container.mainContext.insert(book2)
            
            return container
        }catch {
            fatalError("Failed to create container")
        }
    }()
}

