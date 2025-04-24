//
//  ContentView.swift
//  Fruits
//
//  Created by Abdulgafur Demirci on 21.04.2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    
    var fruits: [Fruit] = fruitsData

    // MARK: - BODY

    var body: some View {
      NavigationView {
        List {
          ForEach(fruits.shuffled()) { item in
            NavigationLink(destination: FruitDetailView(fruit: item)) {
              FruitRowView(fruit: item)
                .padding(.vertical, 4)
            }
          }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
