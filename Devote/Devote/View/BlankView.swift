//
//  BlankView.swift
//  Devote
//
//  Created by Abdulgafur Demirci on 2.05.2025.
//

import SwiftUI

struct BlankView: View {
    // MARK: - PROPERTY
    
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    // MARK: - BODY
    
    var body: some View {
      VStack {
        Spacer()
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      .background(backgroundColor)
      .opacity(backgroundOpacity)
      .blendMode(.overlay)
      .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
        .background(BackgroundImageView())
        .background(backgroundGradient.ignoresSafeArea(.all))
}
