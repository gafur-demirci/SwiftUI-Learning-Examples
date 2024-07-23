//
//  ApplicationData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.07.2024.
//

import SwiftUI
import Observation

struct Book: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var author: String
    var cover: String
    var year: Int
    var selected: Bool
    
    var displayYear: String {
        get {
            return String(year)
        }
    }
}


@Observable class ApplicationData {
    var title: String = "Default Title"
    //var titleInput: String = ""
}
