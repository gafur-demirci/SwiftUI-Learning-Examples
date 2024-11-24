//
//  CommonShapes.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.11.2024.
//

import SwiftUI

struct CommonShapes: View {
    
    let lineStyle = StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [20], dashPhase: 0)
    @State private var setActive: Bool = true
    
    var body: some View {
        VStack {
            Button(action: {
                setActive.toggle()
            }, label: {
                Text(setActive ? "Active" : "Inactive")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
            })
            .background(
                Capsule()
                    .fill(setActive ? Color.green : Color.red)
            )
            /*
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                    Circle()
                        .frame(width: 100, height: 100)
                    Ellipse()
                        .frame(width: 100, height: 50)
                    Capsule()
                        .frame(width: 100, height: 50)
                    RoundedRectangle(cornerRadius: 25)
                    // outer border
                        .stroke(Color.red, lineWidth: 20)
                        .frame(width: 100, height: 100)
                        .padding()
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                    // inner border
                        .strokeBorder(Color.red, lineWidth: 20)
                        .frame(width: 100, height: 100)
                        .padding()
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                    // inner border
                        .strokeBorder(Color.red, style: lineStyle)
                        .frame(width: 100, height: 100)
                }
                .padding()
            }
            */
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CommonShapes()
}
