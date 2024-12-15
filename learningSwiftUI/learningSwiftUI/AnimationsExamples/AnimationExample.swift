//
//  AnimationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct AnimationExample: View {

    @State private var isActive: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "dot.radiowaves.forward")
                .font(.largeTitle)
                .symbolEffect(.scale.up, isActive: isActive)
            Button("Animate") {
                isActive.toggle()
            }
        }
    }
}

#Preview {
    AnimationExample()
}
