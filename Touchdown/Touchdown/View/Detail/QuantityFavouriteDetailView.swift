//
//  QuantityFavouriteDetailView.swift
//  Touchdown
//
//  Created by Abdulgafur Demirci on 1.05.2025.
//

import SwiftUI

struct QuantityFavouriteDetailView: View {
    // MARK: - PROPERTY
    
    @State private var counter: Int = 0
    
    // MARK: - BODY
    
    var body: some View {
      HStack(alignment: .center, spacing: 6, content: {
        Button(action: {
          if counter > 0 {
            feedback.impactOccurred()
            counter -= 1
          }
        }, label: {
          Image(systemName: "minus.circle")
        })
        
        Text("\(counter)")
          .fontWeight(.semibold)
          .frame(minWidth: 36)
        
        Button(action: {
          if counter < 100 {
            feedback.impactOccurred()
            counter += 1
          }
        }, label: {
          Image(systemName: "plus.circle")
        })
        
        Spacer()
        
        Button(action: {
          feedback.impactOccurred()
        }, label: {
          Image(systemName: "heart.circle")
            .foregroundColor(.pink)
        })
      }) //: HSTACK
      .font(.system(.title, design: .rounded))
      .foregroundColor(.black)
      .imageScale(.large)
    }
}

#Preview {
    QuantityFavouriteDetailView()
}
