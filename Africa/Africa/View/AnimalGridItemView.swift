//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Abdulgafur Demirci on 25.04.2025.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    AnimalGridItemView(animal: animals[0])
}
