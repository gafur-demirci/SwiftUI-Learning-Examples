//
//  SectionView.swift
//  Touchdown
//
//  Created by Abdulgafur Demirci on 1.05.2025.
//

import SwiftUI

struct SectionView: View {
    // MARK: - PROPERTY
    
    @State var rotateClockwise: Bool
    
    // MARK: - BODY
    
    var body: some View {
      VStack(spacing: 0) {
        Spacer()
        
        Text("Categories".uppercased())
          .font(.footnote)
          .fontWeight(.bold)
          .foregroundColor(.white)
          .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
        
        Spacer()
      } //: VSTACK
      .background(colorGray.cornerRadius(12))
      .frame(width: 85)
    }
}

#Preview {
    SectionView(rotateClockwise: true)
}
