//
//  AuthorModel.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//

import SwiftUI
import SwiftData

@Model
class Author: Identifiable {
   @Attribute(.unique) var id: UUID = UUID()
   var name: String = ""
   @Relationship(deleteRule: .nullify) var books: [MineBook]? = []

   init(name: String, books: [MineBook]) {
      self.name = name
      self.books = books
   }
    
    var listBooks: [MineBook] {
        get {
            if let books = self.books, !books.isEmpty {
                let sortList = books.sorted(by: { $0.title < $1.title} )
                return sortList
            } else {
                return []
            }
        }
    }
}
