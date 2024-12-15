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
            if isActive {
                Image(systemName: "dot.radiowaves.forward")
                    .font(.largeTitle)
                    .transition(.symbolEffect(.disappear))
            }
            Button("Animate") {
                isActive.toggle()
            }
        }
    }
}

#Preview {
    AnimationExample()
}
