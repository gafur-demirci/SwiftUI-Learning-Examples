//
//  TitleView.swift
//  Touchdown
//
//  Created by Abdulgafur Demirci on 1.05.2025.
//

import SwiftUI

struct TitleView: View {
    // MARK: - PREVIEW
    
    var title: String
    
    // MARK: - BODY
    
    var body: some View {
      HStack {
        Text(title)
          .font(.largeTitle)
          .fontWeight(.heavy)
        
        Spacer()
      } //: HSTACK
      .padding(.horizontal)
      .padding(.top, 15)
      .padding(.bottom, 10)
    }
}

#Preview {
    TitleView(title: "Helmet")
}
