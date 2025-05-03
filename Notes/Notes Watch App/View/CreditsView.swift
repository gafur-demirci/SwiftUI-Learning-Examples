//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Abdulgafur Demirci on 3.05.2025.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTY
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
      return "developer-no\(randomNumber)"
    }

    // MARK: - BODY

    var body: some View {
      VStack(spacing: 3) {
        // PROFILE IMAGE
        Image(randomImage)
          .resizable()
          .scaledToFit()
          .layoutPriority(1)
        
        // HEADER
        HeaderView(title: "Credits")
        
        // CONTENT
        Text("Robert Petras")
          .foregroundColor(.primary)
          .fontWeight(.bold)
        
        Text("Developer")
          .font(.footnote)
          .foregroundColor(.secondary)
          .fontWeight(.light)
      } //: VSTACK
    }
}

#Preview {
    CreditsView()
}
