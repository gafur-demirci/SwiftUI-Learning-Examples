//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Abdulgafur Demirci on 3.05.2025.
//

import SwiftUI

// MARK: - CARD MODEL

struct Card: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var imageName: String
  var callToAction: String
  var message: String
  var gradientColors: [Color]
}
