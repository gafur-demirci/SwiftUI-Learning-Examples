//
//  ShapeAndAnimationView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 3.04.2025.
//

import SwiftUI

struct ShapeAndAnimationView: View {
    
    @State private var firstPercentage : Double = 0
    @State private var secondPercentage : Double = 0
    @State private var thirtPercentage : Double = 0
    
    var body: some View {
        
        ZStack {
            CustomCircular(
                lineWidth: 30,
                backgroundColor: Color.blue.opacity(0.2),
                foregroundColor: Color.blue,
                percentage: firstPercentage
            )
            .frame(width: 300, height: 300)
            .onTapGesture {
                if firstPercentage == 0 {
                    firstPercentage = 50
                } else {
                    firstPercentage = 0
                }
            }
            CustomCircular(
                lineWidth: 30,
                backgroundColor: Color.red.opacity(0.2),
                foregroundColor: Color.red,
                percentage: secondPercentage
            )
            .frame(width: 200, height: 200)
            .onTapGesture {
                if secondPercentage == 0 {
                    secondPercentage = 75
                } else {
                    secondPercentage = 0
                }
            }
            CustomCircular(
                lineWidth: 30,
                backgroundColor: Color.green.opacity(0.2),
                foregroundColor: Color.green,
                percentage: thirtPercentage
            )
            .frame(width: 100, height: 100)
            .onTapGesture {
                if thirtPercentage == 0 {
                    thirtPercentage = 100
                } else {
                    thirtPercentage = 0
                }
            }
        }
    }
}

#Preview {
    ShapeAndAnimationView()
}
