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
    var info: Data?
    
    init(name: String, books: [MineBook], info: Data?) {
        self.name = name
        self.books = books
        self.info = info
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
    var showBirthday: String? {
        let decoder = JSONDecoder()
        if let info, let authorInfo = try? decoder.decode(AuthorInfo.self, from: info) {
            if let date = authorInfo.birthDay, date < Date() {
                return authorInfo.birthDay?.formatted(date: .abbreviated, time: .omitted)
            }
        }
        return nil
    }
    var showPlaceOfBirth: String? {
        let decoder = JSONDecoder()
        if let info, let authorInfo = try? decoder.decode(AuthorInfo.self, from: info) {
            if !authorInfo.placeOfBirth.isEmpty {
                return authorInfo.placeOfBirth
            }
        }
        return nil
    }
}
