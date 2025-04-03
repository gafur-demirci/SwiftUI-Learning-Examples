//
//  CustomCircular.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 3.04.2025.
//

import SwiftUI

struct CustomCircular: View {
    
    let lineWidth: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let percentage: Double
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                CircularShape(percent: 100, startAngle: 90)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgroundColor)
                CircularShape(percent: percentage, startAngle: -90)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(foregroundColor)
            }
            .animation(.easeIn(duration: 1), value: percentage)
            .padding(lineWidth/1.5)
        }
    }
}

#Preview {
    CustomCircular(lineWidth: 10, backgroundColor: .red, foregroundColor: .green, percentage: 50)
}
