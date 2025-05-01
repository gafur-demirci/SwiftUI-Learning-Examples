//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by Abdulgafur Demirci on 1.05.2025.
//

import SwiftUI

struct FeaturedItemView: View {
    // MARK: - PROPERTY
    
    let player: Player
    
    // MARK: - BODY
    
    var body: some View {
      Image(player.image)
        .resizable()
        .scaledToFit()
        .cornerRadius(12)
    }
}

#Preview {
    FeaturedItemView(player: players[0])
}
