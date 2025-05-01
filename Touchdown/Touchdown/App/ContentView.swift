//
//  ContentView.swift
//  Touchdown
//
//  Created by Abdulgafur Demirci on 27.04.2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
