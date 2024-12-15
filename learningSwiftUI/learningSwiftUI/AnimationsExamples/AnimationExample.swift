//
//  AnimationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct AnimationExample: View {
    
    @State private var smiling: Bool = false
    
    var body: some View {
        VStack {
            Face(smile: smiling ? 1 : 0)
                .stroke(Color.blue, lineWidth: 5)
                .frame(width: 100, height: 120)
            Button("Change") {
                withAnimation(.default) {
                    smiling.toggle()
                }
            }
        }
        .padding()
    }
}

#Preview {
    AnimationExample()
}
