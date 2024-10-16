//
//  BookModel.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//

import SwiftUI
import SwiftData

@Model
class MineBook: Identifiable {
   @Attribute(.unique) var id: UUID = UUID()
   var title: String = ""
   @Relationship(deleteRule: .nullify, inverse: \Author.books) var author: Author?
   var cover: String = ""
   var year: Int = 0

   init(title: String, author: Author?, cover: String, year: Int) {
      self.title = title
      self.author = author
      self.cover = cover
      self.year = year
   }
   var displayYear: String {
      get {
         let value = year > 0 ? String(year) : "Undefined"
         return value
      }
   }
}
