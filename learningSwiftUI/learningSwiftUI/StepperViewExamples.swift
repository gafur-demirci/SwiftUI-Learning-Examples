//
//  StepperViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.07.2024.
//

import SwiftUI

struct StepperViewExamples: View {
    
    @State private var currentValue: Float = 0
    
    var body: some View {
        VStack {
            Text("Current value: \(currentValue.formatted(.number.precision(.fractionLength(0))))")
            Stepper("Counter", value: $currentValue, in: 0...100)
            Spacer()
        }
    }
}

#Preview {
    StepperViewExamples()
}
