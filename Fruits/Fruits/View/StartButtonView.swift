//
//  StartButtonView.swift
//  Fruits
//
//  Created by Abdulgafur Demirci on 21.04.2025.
//

import SwiftUI

struct StartButtonView: View {
    
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
      Button(action: {
        isOnboarding = false
      }) {
        HStack(spacing: 8) {
          Text("Start")
          
          Image(systemName: "arrow.right.circle")
            .imageScale(.large)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
          Capsule()
            .strokeBorder(
                Color.white,
                lineWidth: 1.25
            )
        )
      } //: BUTTON
      .accentColor(Color.white)
    }
}

#Preview {
    StartButtonView()
}
