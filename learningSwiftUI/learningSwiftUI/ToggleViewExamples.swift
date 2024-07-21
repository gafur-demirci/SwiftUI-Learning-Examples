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
            Toggle("",isOn: $currentState)
                .labelsHidden()
            Text(currentState ? "On" : "Off")
                .padding()
                .background(Color(currentState ? .yellow : .gray))
        }
        .padding()
    }
}

#Preview {
    ToggleViewExamples()
}
