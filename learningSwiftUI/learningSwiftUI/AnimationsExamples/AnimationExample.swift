//
//  AnimationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct AnimationExample: View {
    
    @Namespace private var myAnimations
    @State private var showInfo: Bool = false
    
    var body: some View {
        VStack {
            Button("Show Information") {
                withAnimation(.easeInOut) {
                    showInfo.toggle()
                }
            }
            .padding()
            HStack {
                if !showInfo {
                    Text("Left")
                        .matchedGeometryEffect(id: "TextAnimation", in: myAnimations)
                }
                Spacer()
                if showInfo {
                    Text("Right")
                        .matchedGeometryEffect(id: "TextAnimation", in: myAnimations)
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
