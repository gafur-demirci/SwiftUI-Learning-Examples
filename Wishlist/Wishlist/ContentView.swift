//
//  ContentView.swift
//  Wishlist
//
//  Created by Abdulgafur Demirci on 9.04.2025.
//

import SwiftUI

struct ContentView: View {
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
        .modelContainer(for: Wish.self, inMemory: true)
}
