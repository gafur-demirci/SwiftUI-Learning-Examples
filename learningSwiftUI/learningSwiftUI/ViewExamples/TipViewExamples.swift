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
            Button("Show Tip") {
                print("Action Performed")
            }
            TipView(tipButton)
        }
        .padding()
        .task {
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault),
            ])
        }
        Spacer()
    }
}

#Preview {
    TipViewExamples()
}
