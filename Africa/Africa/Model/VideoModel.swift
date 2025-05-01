//
//  VideoModel.swift
//  Africa
//
//  Created by Abdulgafur Demirci on 25.04.2025.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // Computed Property
  var thumbnail: String {
    "video-\(id)"
  }
}
