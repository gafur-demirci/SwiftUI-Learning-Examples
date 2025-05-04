//
//  FactModel.swift
//  Avocados
//
//  Created by Abdulgafur Demirci on 3.05.2025.
//

import Foundation

// MARK: - FACT MODEL

struct Fact: Identifiable {
  var id = UUID()
  var image: String
  var content: String
}
