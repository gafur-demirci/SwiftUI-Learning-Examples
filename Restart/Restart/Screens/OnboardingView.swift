//
//  OnboardingView.swift
//  Restart
//
//  Created by Abdulgafur Demirci on 13.04.2025.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - PROPERTIES
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            Button(action: {
                isOnboardingViewActive = false
            }, label: {
                Text("Start")
            })
        }
    }
}

#Preview {
    OnboardingView()
}
