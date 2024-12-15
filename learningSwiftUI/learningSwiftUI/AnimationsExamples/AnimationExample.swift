//
//  AnimationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct AnimationExample: View {
    
    @State private var showInfo: Bool = false
    
    var body: some View {
        VStack {
            Button("Show Information") {
                showInfo.toggle()
            }
            .padding()
            HStack {
                if !showInfo {
                    Text("Left")
                        .transition(.scale.animation(.default))
                }
                Spacer()
                if showInfo {
                    Text("Right")
                        .transition(.scale.animation(.default))
                }
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    AnimationExample()
}
