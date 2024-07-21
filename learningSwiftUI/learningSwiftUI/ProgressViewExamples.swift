//
//  ProgressViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.07.2024.
//

import SwiftUI

struct ProgressViewExamples: View {
    
    @State private var currentValue: Float = 5
    
    var body: some View {
        VStack {
            ProgressView(value: currentValue, total: 10)
            Spacer()
        }
    }
}

#Preview {
    ProgressViewExamples()
}
