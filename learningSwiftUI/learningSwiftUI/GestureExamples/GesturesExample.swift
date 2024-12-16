//
//  GesturesExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct GesturesExample: View {
    
    @GestureState private var rotationAngle: Angle = .zero
    @State private var rotation: Angle = .zero
    
    var body: some View {
        
        Image("book1")
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 200)
            .rotationEffect(rotation + rotationAngle)
            .gesture(
                RotateGesture()
                    .updating($rotationAngle) { value, state, transaction in
                        state = value.rotation
                    }
                    .onEnded({ value in
                        rotation = rotation + value.rotation
                    })
            )
    }
}

#Preview {
    GesturesExample()
}
