//
//  ContentView.swift
//  Restart
//
//  Created by Abdulgafur Demirci on 13.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
