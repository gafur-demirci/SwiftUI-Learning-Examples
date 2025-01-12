//
//  landmarkData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 11.01.2025.
//

import SwiftUI
import Observation

struct Landmark: Identifiable {
    var id = UUID()
    var name: String
    var picture: String
}
@Observable class LandMarkData {
    
    var landmarks: [Landmark] = []
    
    init() {
        landmarks.append(Landmark(name: "London", picture: "london"))
        landmarks.append(Landmark(name: "Paris", picture: "paris"))
        landmarks.append(Landmark(name: "Tokyo", picture: "tokyo"))
        landmarks.append(Landmark(name: "New York", picture: "newyork"))
        landmarks.append(Landmark(name: "Berlin", picture: "berlin"))
        landmarks.append(Landmark(name: "Madrid", picture: "madrid"))
        landmarks.append(Landmark(name: "Rome", picture: "rome"))
        landmarks.append(Landmark(name: "Amsterdam", picture: "amsterdam"))
    }
}
