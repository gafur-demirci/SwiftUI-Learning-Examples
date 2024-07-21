//
//  ToggleViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 17.07.2024.
//

import SwiftUI

struct ToggleViewExamples: View {
    
    @State private var currentState: Bool = true
    
    var body: some View {
        HStack {
            Toggle(isOn: $currentState, label: {
                Label("Send", systemImage: "mail")
            })
            .toggleStyle(.button)
        }
        .padding()
    }
}

#Preview {
    ToggleViewExamples()
}
