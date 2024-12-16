//
//  GesturesExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct GesturesExample: View {
    
    @State private var picture: Image = Image("nocover")
    
    var body: some View {
        
        picture
            .resizable()
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 400)
            .dropDestination(for: Image.self, action: { elements, location in
                if let image = elements.first {
                    picture = image
                    return true
                }
                return false
            })
        Spacer()
    }
}

#Preview {
    GesturesExample()
}
