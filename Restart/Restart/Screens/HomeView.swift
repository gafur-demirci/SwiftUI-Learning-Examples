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
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 20) {
            
            // MARK: - HEADER
            
            Spacer()
            
            ZStack {
                
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        .easeInOut(duration: 4)
                        .repeatForever(autoreverses: true),
                        value: isAnimating
                    )
            }
            
            // MARK: - CENTER
            
            Text("The time that  leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - FOOTER
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    isOnboardingViewActive = true
                }
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.title3)
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
            }) //: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTACK
    } //: BODY
}

#Preview {
    HomeView()
}
