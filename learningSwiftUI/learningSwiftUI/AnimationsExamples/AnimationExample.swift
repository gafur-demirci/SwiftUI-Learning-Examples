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
            if showInfo {
                Text("This is the information")
                    .transition(.myTransition)
            }
            Spacer()
        }
    }
}

extension AnyTransition {
    static var myTransition: AnyTransition {
        let animation = Animation.easeInOut(duration: 2)
        let transiton = AnyTransition.scale.animation(animation)
        return transiton
    }
}

#Preview {
    AnimationExample()
}
