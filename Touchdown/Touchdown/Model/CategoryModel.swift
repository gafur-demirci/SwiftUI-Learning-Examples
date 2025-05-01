//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Abdulgafur Demirci on 1.05.2025.
//

import Foundation

struct Category: Codable, Identifiable {
  let id: Int
  let name: String
  let image: String
}
