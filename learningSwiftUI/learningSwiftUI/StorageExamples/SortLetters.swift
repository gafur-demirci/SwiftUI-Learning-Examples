//
//  SortLetters.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 16.11.2024.
//

import SwiftUI
import SwiftData

@Model
class SortLetters {
    var letter: String = ""
    @Relationship(deleteRule: .nullify) var books: [MineBook]? = []
    
    init(letter: String, books: [MineBook]) {
        self.letter = letter
        self.books = books
    }
    
    var listBooks: [MineBook] {
        get {
            if let books = self.books, !books.isEmpty {
                let sortList = books.sorted(by: { $0.title < $1.title })
                return sortList
            } else {
                return []
            }
        }
    }
    
}
