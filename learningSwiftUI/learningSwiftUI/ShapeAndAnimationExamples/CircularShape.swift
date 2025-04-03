//
//  CircularShape.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 3.04.2025.
//

import SwiftUI

struct CircularShape: Shape {
    
    var percent: Double
    var startAngle: Double
    
    typealias AnimatableData = Double
    var animatableData: Double {
        get { percent }
        set { percent = newValue }
    }
    
    init(percent: Double, startAngle: Double) {
        self.percent = percent
        self.startAngle = startAngle
    }
    
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = (percent / 100 * 360.0) + startAngle
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
        }
    }
}
