//
//  ButtonImageView.swift
//  Watchlist
//
//  Created by Abdulgafur Demirci on 13.04.2025.
//

import SwiftUI

struct ButtonImageView: View {
    
    let symbolName: String
    
    var body: some View {
        Image(systemName: symbolName)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.blue.gradient)
            .padding(8)
            .background(
                Circle()
                    .fill(.ultraThickMaterial)
            )
            .frame(width: 80)
    }
}

#Preview {
    ButtonImageView(symbolName: "plus.circle.fill")
}
