//
//  RecipeModel.swift
//  Avocados
//
//  Created by Abdulgafur Demirci on 3.05.2025.
//

import Foundation

// MARK: - RECIPE MODEL

struct Recipe: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var rating: Int
  var serves: Int
  var preparation: Int
  var cooking: Int
  var instructions: [String]
  var ingredients: [String]
}
