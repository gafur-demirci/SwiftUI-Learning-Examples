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
    @Attribute(.externalStorage)  var cover: Data?
    var year: Int = 0
    @Relationship(deleteRule: .nullify, inverse: \SortLetters.books) var sortletter: SortLetters?
    
    init(title: String, author: Author?, cover: Data?, year: Int, sortletter: SortLetters?) {
        self.title = title
        self.author = author
        self.cover = cover
        self.year = year
        self.sortletter = sortletter
    }
    var displayYear: String {
        get {
            let value = year > 0 ? String(year) : "Undefined"
            return value
        }
    }
    #if os(iOS)
    var displayCover: UIImage {
        if let data = cover, let image = UIImage(data: data) {
            return image
        } else {
            return UIImage(named: "nocover")!
        }
    }
    #endif
}
