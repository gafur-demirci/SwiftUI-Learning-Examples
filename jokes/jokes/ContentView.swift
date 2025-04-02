//
//  ContentView.swift
//  jokes
//
//  Created by Abdulgafur Demirci on 2.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = JokesViewModel()
    
    var body: some View {
        NavigationView(content: {
            List(viewModel.jokes, id: \.self.id) { joke in
                Text(joke.value)
            }
            .navigationTitle(Text("Chuck Norris Jokes"))
            .toolbar {
                Button(action: viewModel.fetchJokes) {
                    Label("Refresh", systemImage: "arrow.clockwise")
                }
            }
        })
//        .onAppear(perform: viewModel.fetchJokes)
    }
}

#Preview {
    ContentView()
}
