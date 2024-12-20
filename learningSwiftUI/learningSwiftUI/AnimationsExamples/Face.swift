//
//  Face.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct Face: Shape {
    var smile: CGFloat
    var animatableData: CGFloat {
        get {
            return smile
        }
        set {
            self.smile = newValue
        }
    }
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let smileClamp = min(max(smile, 0), 1)
        let section = rect.height / 5
        let smilePos = section + (section * 3 * smileClamp)
        
        var path = Path()

        path.addEllipse(in: CGRect(x: width / 10 * 2 - 10, y: rect.minY, width: 20, height: 20))
        path.addEllipse(in: CGRect(x: width / 10 * 8 - 10, y: rect.minY, width: 20, height: 20))
        
        path.move(to: CGPoint(x: width / 10 * 2, y: rect.midY))
        path.addCurve(to: CGPoint(x: width / 10 * 8, y: rect.midY), control1: CGPoint(x: width / 5, y: smilePos), control2: CGPoint(x: width / 4 * 3, y: smilePos))
        
        return path
    }
}
