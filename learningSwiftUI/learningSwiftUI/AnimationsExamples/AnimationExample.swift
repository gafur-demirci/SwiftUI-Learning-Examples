//
//  AnimationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

class animationViewData {
    var posX: CGFloat = 0
    var posY: CGFloat = 0
    var lastTime: Double = 0
    var maxTime: Double = 0.5
}

struct AnimationExample: View {
    
    let viewData = animationViewData()
    
    var body: some View {
        TimelineView(.animation) { time in
            let interval = time.date.timeIntervalSinceReferenceDate
            let delta = interval - viewData.lastTime
            
            Canvas { context, size in
                if delta > viewData.maxTime {
                    viewData.posX = CGFloat.random(in: 0..<size.width - 20)
                    viewData.posY = CGFloat.random(in: 0..<size.height - 20)
                    viewData.lastTime = interval
                }
                let circleFrame = CGRect(x: viewData.posX, y: viewData.posY, width: 20, height: 20)
                context.fill(Circle().path(in: circleFrame), with: .color(.red))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    AnimationExample()
}
