//
//  ContentView.swift
//  Watchlist
//
//  Created by Abdulgafur Demirci on 12.04.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.modelContext) var modelContext
    @Query var movies: [Movie]
    
    @State private var isSheetPresented: Bool = false
    @State private var randomMovie: String = ""
    @State private var isShowingAlert: Bool = false
    
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
