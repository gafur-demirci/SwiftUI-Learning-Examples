//
//  Pet.swift
//  Paws
//
//  Created by Abdulgafur Demirci on 12.04.2025.
//

import Foundation
import SwiftData

@Model
final class Pet {
    var  name: String
    @Attribute(.externalStorage) var photo: Data?
    
    init(name: String, photo: Data? = nil) {
        self.name = name
        self.photo = photo
    }
}

extension Pet {
    @MainActor
    static var preivew: ModelContainer {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Pet.self, configurations: configuration)
        
        container.mainContext.insert(Pet(name: "Rexy"))
        container.mainContext.insert(Pet(name: "Bella"))
        container.mainContext.insert(Pet(name: "Charlie"))
        container.mainContext.insert(Pet(name: "Daisy"))
        container.mainContext.insert(Pet(name: "Fido"))
        container.mainContext.insert(Pet(name: "Gus"))
        container.mainContext.insert(Pet(name: "Mimi"))
        container.mainContext.insert(Pet(name: "Luna"))
        
        return container
    }
}
