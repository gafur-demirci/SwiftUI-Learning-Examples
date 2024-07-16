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
        VStack(spacing: 10){
            TextField("Insert Text", text: $text, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding(20)
                .lineLimit(5)
        }
        .padding()
    }
}

#Preview {
    TextFieldViewExamples()
}
