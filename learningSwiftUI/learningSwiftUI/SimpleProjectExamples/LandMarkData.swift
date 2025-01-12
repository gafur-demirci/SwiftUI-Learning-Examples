//
//  landmarkData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 11.01.2025.
//

import SwiftUI
import Observation

struct Landmark: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var picture: String
    var place: String?
}
@Observable class LandMarkData {
    
    var landmarks: [Landmark] = []
    
    init() {
        landmarks.append(Landmark(name: "London", picture: "london", place: "London Eye"))
        landmarks.append(Landmark(name: "Paris", picture: "paris", place: "Eifel Tower"))
        landmarks.append(Landmark(name: "Tokyo", picture: "tokyo", place: "Meiji Tapestry"))
        landmarks.append(Landmark(name: "New York", picture: "newyork", place: "Freedom Tower"))
        landmarks.append(Landmark(name: "Berlin", picture: "berlin", place: "Brandenburg Door"))
        landmarks.append(Landmark(name: "Madrid", picture: "madrid", place: "Retiro Park"))
        landmarks.append(Landmark(name: "Rome", picture: "rome", place: "Colosseum"))
        landmarks.append(Landmark(name: "Amsterdam", picture: "amsterdam", place: "Van Gogh Museum"))

    }
}
