//
//  ApplicationData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//


import SwiftUI
import Observation

@Observable class ApplicationData {
   var viewPath = NavigationPath()
   var selectedBook: MineBook? = nil
   var selectedAuthor: Author? = nil
}
