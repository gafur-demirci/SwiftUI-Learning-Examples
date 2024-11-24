//
//  PathViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 24.11.2024.
//

import SwiftUI

struct PathViewExamples: View {
    var body: some View {
        /*
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 100, y: 150))      // start point
                path.addLine(to: CGPoint(x: 200 , y: 150))  // move pencel x to 50 point ( start point to line end point )
                path.addLine(to: CGPoint(x: 100, y: 250))   // move pencel y to 100 point( start previous line end point to line end point )
                path.closeSubpath()                         // close added lines first line start point end last line end point
            }
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5))
            .padding()
            Path { path in
                path.move(to: CGPoint(x: 100, y: 150))
                path.addLine(to: CGPoint(x: 200 , y: 150))
                path.addArc(center: CGPoint(x: 200, y: 170), radius: 20, startAngle: .degrees(270), endAngle: .degrees(90), clockwise: false)
                path.addLine(to: CGPoint(x: 100, y: 190))
                path.closeSubpath()
            }
            .stroke(Color.red, style: StrokeStyle(lineWidth: 5))
            Path { path in
                path.move(to: CGPoint(x: 100, y: 150))
                path.addLine(to: CGPoint(x: 200 , y: 150))
                path.addEllipse(in: CGRect(x: 200, y: 140, width: 20, height: 20))
            }
            .stroke(Color.green, style: StrokeStyle(lineWidth: 5))
            Path { path in
                path.move(to: CGPoint(x: 50, y: 50))
                path.addQuadCurve(to: CGPoint(x: 50, y: 200), control: CGPoint(x: 100, y: 125))
                path.move(to: CGPoint(x: 250, y: 50))
                path.addCurve(to: CGPoint(x: 250, y: 200), control1: CGPoint(x: 200, y: 125), control2: CGPoint(x: 300, y: 125))
            }
            .stroke(Color.yellow, style: StrokeStyle(lineWidth: 5))
        }
        */
        /*
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width / 2
                let height = width
                let posX = (geometry.size.width - width) / 2
                let posY = (geometry.size.height - height) / 2
                
                path.move(to: CGPoint(x: posX, y: posY))
                path.addLine(to: CGPoint(x: posX + width, y: posY))
                path.addLine(to: CGPoint(x: posX, y: posY + height))
                path.closeSubpath()
            }
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5))
        }
        */
        VStack {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    Triangle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 50)
                    Triangle()
                        .fill(Color.green)
                        .frame(width: 120, height: 100)
                    Triangle()
                        .fill(Color.yellow)
                        .frame(width: 120, height: 80)
                    Triangle()
                        .fill(Color.red)
                        .frame(width: 50, height: 50)
                }
                .padding()
                Spacer()
            }
        }

    }
}

#Preview {
    PathViewExamples()
}
