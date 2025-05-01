//
//  InsetFactView.swift
//  Africa
//
//  Created by Abdulgafur Demirci on 25.04.2025.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal

    // MARK: - BODY

    var body: some View {
      GroupBox {
        TabView {
          ForEach(animal.fact, id: \.self) { item in
            Text(item)
          }
        } //: TABS
        .tabViewStyle(PageTabViewStyle())
        .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
      } //: BOX
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    InsetFactView(animal: animals[0])
}
