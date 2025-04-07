//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Abdulgafur Demirci on 7.04.2025.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ?
                // User pressed the button apply this style
                LinearGradient(
                    gradient: Gradient(colors: [.customGrayMedium, .customGrayLight]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                :
                // User not pressed the button apply this style
                LinearGradient(
                    gradient: Gradient(colors: [.customGrayLight, .customGrayMedium]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(40)
    }
}
