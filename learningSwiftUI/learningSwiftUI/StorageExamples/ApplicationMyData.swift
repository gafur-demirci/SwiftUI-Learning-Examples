//
//  ApplicationData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//


import SwiftUI
import Observation

@Observable class ApplicationMyData {
   var viewPath = NavigationPath()
   var selectedBook: Book? = nil
   var selectedAuthor: Author? = nil
}
