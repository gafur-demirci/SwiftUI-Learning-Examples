//
//  RipeningModel.swift
//  Avocados
//
//  Created by Abdulgafur Demirci on 3.05.2025.
//

import Foundation

// MARK: RIPENING MODEL

struct Ripening: Identifiable {
  var id = UUID()
  var image: String
  var stage: String
  var title: String
  var description: String
  var ripeness: String
  var instruction: String
}
