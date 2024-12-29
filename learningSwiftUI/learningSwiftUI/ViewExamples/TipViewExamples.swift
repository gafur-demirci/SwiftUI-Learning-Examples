//
//  TipViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 29.12.2024.
//

import SwiftUI
import TipKit

struct TipViewExamples: View {
    
    let tipButton: TipButton = TipButton()
    
    var body: some View {
        VStack {
            Button("Save") {
                print("Action Performed")
                tipButton.invalidate(reason: .actionPerformed)
            }
//            TipView(tipButton)
            .popoverTip(tipButton)
        }
        .padding()
        .task {
            try? Tips.configure([
                .displayFrequency(.daily),
            ])
        }
        Spacer()
    }
}

#Preview {
    TipViewExamples()
}
