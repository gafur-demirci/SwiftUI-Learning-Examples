//
//  Triangle.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 24.11.2024.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let posX = rect.origin.x
        let posY = rect.origin.y
        
        path.move(to: CGPoint(x: posX, y: posY))
        path.addLine(to: .init(x: posX + width, y: posY))
        path.addLine(to: .init(x: posX, y: posY + height))
        path.closeSubpath()
        
        return path
    }
}
