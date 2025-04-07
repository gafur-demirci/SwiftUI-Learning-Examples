//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Abdulgafur Demirci on 7.04.2025.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            
            // MARK: - 3. Depth
            
            Color(.colorGreenDark)
                .cornerRadius(40)
                .offset(y: 12)
            // MARK: - 2. Light
            
            Color(.colorGreenLight)
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            // MARK: - 1. Surface
            
            LinearGradient(
                gradient: Gradient(colors: [.colorGreenLight, .colorGreenMedium]),
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding(20)
}
