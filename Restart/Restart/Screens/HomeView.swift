//
//  HomeView.swift
//  Restart
//
//  Created by Abdulgafur Demirci on 13.04.2025.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardingViewActive = true
            }, label: {
                Text("Restart")
            })
        } //: VSTACK
    } //: BODY
}

#Preview {
    HomeView()
}
