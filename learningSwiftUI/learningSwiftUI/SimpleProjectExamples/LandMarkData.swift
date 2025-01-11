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
    var picture: Data
}
class LandMarkData: ObservableObject {
    
    @Published var landmarks: [Landmark] = [
        Landmark(name: "London", picture: UIImage(named: "london")!.pngData()!),
        Landmark(name: "Paris", picture: UIImage(named: "paris")!.pngData()!),
        Landmark(name: "Tokyo", picture: UIImage(named: "tokyo")!.pngData()!),
        Landmark(name: "New York", picture: UIImage(named: "newyork")!.pngData()!),
        Landmark(name: "Berlin", picture: UIImage(named: "berlin")!.pngData()!),
        Landmark(name: "Madrid", picture: UIImage(named: "madrid")!.pngData()!),
        Landmark(name: "Rome", picture: UIImage(named: "rome")!.pngData()!),
        Landmark(name: "Amsterdam", picture: UIImage(named: "amsterdam")!.pngData()!)
    ]
}
