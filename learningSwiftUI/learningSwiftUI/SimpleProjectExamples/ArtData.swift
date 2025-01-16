//
//  ArtData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 16.01.2025.
//

import SwiftUI
import Observation

class Art : Identifiable {
    var id = UUID()
    var name: String
    var artist: String
    var year: Int32
    var image: UIImage
    
    init(name: String, artist: String, year: Int32, image: UIImage) {
        self.name = name
        self.artist = artist
        self.year = year
        self.image = image
    }
}

@Observable class ArtData {
    
    var arts: [Art] = []
    
}
