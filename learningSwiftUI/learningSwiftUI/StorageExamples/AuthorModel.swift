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
}
