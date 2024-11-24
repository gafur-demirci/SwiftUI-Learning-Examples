//
//  PathViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 24.11.2024.
//

import SwiftUI

struct PathViewExamples: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 100, y: 150))      // start point
            path.addLine(to: CGPoint(x: 200 , y: 150))  // move pencel x to 50 point ( start point to line end point )
            path.addLine(to: CGPoint(x: 100, y: 250))   // move pencel y to 100 point( start previous line end point to line end point )
            path.closeSubpath()                         // close added lines first line start point end last line end point
        }
        .stroke(Color.blue, style: StrokeStyle(lineWidth: 5))
    }
}

#Preview {
    PathViewExamples()
}
