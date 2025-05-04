//
//  HeaderModel.swift
//  Avocados
//
//  Created by Abdulgafur Demirci on 3.05.2025.
//

import Foundation

// MARK: - HEADER MODEL

struct Header: Identifiable {
  var id = UUID()
  var image: String
  var headline: String
  var subheadline: String
}
