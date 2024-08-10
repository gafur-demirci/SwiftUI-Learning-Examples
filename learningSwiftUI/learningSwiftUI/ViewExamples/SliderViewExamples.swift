//
//  SliderViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.07.2024.
//

import SwiftUI

struct SliderViewExamples: View {
    
    @State private var currentValue: Float = 5
    @State private var textActive: Bool = false
    
    var body: some View {
        VStack{
            Text("Current value: \(currentValue.formatted(.number.precision(.fractionLength(0))))")
                .padding()
                .background(textActive ? Color.yellow : Color.green)
            Slider(value: $currentValue, in: 0...10, step: 1.0, onEditingChanged: {self.textActive = $0})
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SliderViewExamples()
}
