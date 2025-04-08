//
//  CustomCircleView.swift
//  Hike
//
//  Created by Abdulgafur Demirci on 8.04.2025.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.customIndigoMedium, .customSalmonLight]),
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear {
                    withAnimation(Animation.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        self.isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
        } //: ZSTACK
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
