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
            
            let book1 = MineBook(title: "Christine", author: author, cover: "book10", year: 1987)
            container.mainContext.insert(book1)
            
            let book2 = MineBook(title: "IT", author: author, cover: "book11", year: 1986)
            container.mainContext.insert(book2)
            
            return container
        }catch {
            fatalError("Failed to create container")
        }
    }()
    @MainActor
    static var sample: MineBook {
        let context = PreviewContainer.container.mainContext
        let descriptor = FetchDescriptor<MineBook>(predicate: #Predicate{_ in true} , sortBy: [SortDescriptor(\.title)])
        do {
            let results = try context.fetch(descriptor)
            return results[0]
        } catch {
            fatalError("Failed to fetch sample")
        }
    }
}

