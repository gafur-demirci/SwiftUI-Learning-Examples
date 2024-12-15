//
//  AnimationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

class animationViewData {
    var radius: CGFloat = 0
    var step: CGFloat = 5
    var lastTime: Double = 0
    var maxTime: Double = 0.02
}

struct AnimationExample: View {
    
    let viewData = animationViewData()
    
    var body: some View {
        TimelineView(.animation) { time in
            let interval = time.date.timeIntervalSinceReferenceDate
            let delta = interval - viewData.lastTime
            
            Canvas { context, size in
                if delta > viewData.maxTime {
                    calculateRadius()
                    viewData.lastTime = interval
                }
                let rad = viewData.radius
                let circleFrame = CGRect(x: size.width / 2 - rad, y: size.height / 2 - rad, width: rad * 2, height: rad * 2)
                context.fill(Circle().path(in: circleFrame), with: .color(.red))
            }
            .ignoresSafeArea()
        }
    }
    func calculateRadius() {
        viewData.radius = viewData.radius + viewData.step
        if viewData.step < 0 && viewData.radius < 0 {
            viewData.radius = 0
            viewData.step = 5
        }
        if viewData.step > 0 && viewData.radius > 150 {
            viewData.radius = 150
            viewData.step = -5
        }
    }
}

#Preview {
    AnimationExample()
}
