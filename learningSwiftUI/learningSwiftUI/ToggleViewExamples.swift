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
        VStack {
            Toggle(isOn: $currentState, label: {
                Text(currentState ? "On" : "Off")
            })
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ToggleViewExamples()
}
