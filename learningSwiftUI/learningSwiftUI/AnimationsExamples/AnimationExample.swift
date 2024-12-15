//
//  AnimationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct AnimationExample: View {
    
    @State private var boxScale: CGFloat = 1
    @State private var roundCorners: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
                    .cornerRadius(roundCorners ? 15 : 0)
                    .scaleEffect(boxScale)
            }
            .frame(width: 250, height: 120)
            Button("Animate") {
                withAnimation(.easeInOut(duration: 2)) {
                    boxScale = boxScale == 1 ? 2 : 1
                    roundCorners = !roundCorners
                }
            }
        }
        .padding()
    }
}

#Preview {
    AnimationExample()
}
