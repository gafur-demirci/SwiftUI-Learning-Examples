//
//  CustomButtonView.swift
//  Hike
//
//  Created by Abdulgafur Demirci on 7.04.2025.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.white, .customGreenLight, .customGreenMedium]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [.customGrayLight, .customGrayMedium]),
                        startPoint: .top,
                        endPoint: .bottom),
                    lineWidth: 4)
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.customGrayLight, .customGrayMedium]),
                        startPoint: .top,
                        endPoint: .bottom)
                )
                
        }
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButtonView()
        .padding()
}
