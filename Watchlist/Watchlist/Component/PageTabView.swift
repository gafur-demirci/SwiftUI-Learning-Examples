//
//  PageTabView.swift
//  Watchlist
//
//  Created by Abdulgafur Demirci on 13.04.2025.
//

import SwiftUI

struct PageTabView: View {
    
    var icon: String
    var description: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .imageScale(.large)
                .font(.largeTitle.weight(.light))
                .symbolEffect(.breathe)
            Text(description)
                .font(.title.weight(.light))
                .fontWidth(.compressed)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    PageTabView(icon: "1.circle", description: "Add some movies to the watchlist if you plan to watch later")
        .padding()
}
