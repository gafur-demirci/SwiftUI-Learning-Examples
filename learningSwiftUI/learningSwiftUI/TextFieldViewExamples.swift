//
//  TextFieldViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.07.2024.
//

import SwiftUI

struct TextFieldViewExamples: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack(spacing: 15){
            TextEditor(text: $text)
                .multilineTextAlignment(.leading)
                .lineSpacing(10)
                .autocorrectionDisabled(true)
                .padding(8)
        }
        .padding()
    }
}

#Preview {
    TextFieldViewExamples()
}
