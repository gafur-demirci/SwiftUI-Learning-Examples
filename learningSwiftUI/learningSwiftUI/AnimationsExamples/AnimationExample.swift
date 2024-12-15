//
//  AnimationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct AnimationExample: View {
    
    @State private var boxScale: CGFloat = 1
    
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
                    .scaleEffect(boxScale)
            }
            .frame(width: 250, height: 120)
            Button("Animate") {
                let animation = Animation.bouncy
                    .delay(1)
                    .speed(2)
                    .repeatCount(3)
                withAnimation(animation) {
                    boxScale = boxScale == 1 ? 2 : 1
                }
            }
        }
        .padding()
    }
}

#Preview {
    AnimationExample()
}
