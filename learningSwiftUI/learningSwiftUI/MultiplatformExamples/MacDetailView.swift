//
//  MacDetailView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 25.12.2024.
//

import SwiftUI

struct MacDetailView: View {
    
    @Environment(MacData.self ) private var macData
    
    var body: some View {
        List {
            ForEach(macData.foodList, id: \.self) { food in
                Text(food)
            }
        }
        .navigationTitle("Food List")
        #if os(macOS)
        .alternatingRowBackgrounds()
        #endif
    }
}

#Preview {
    MacDetailView()
        .environment(MacData())
}
