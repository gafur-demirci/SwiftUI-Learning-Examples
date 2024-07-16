//
//  TextFieldViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.07.2024.
//

import SwiftUI

struct TextFieldViewExamples: View {
    
    @State private var title: String = "Default Title"
    @State private var titleInput: String = ""
    
    var body: some View {
        VStack{
            Text(title)
                .lineLimit(1)
                .padding()
                .background(Color.yellow)
            TextField("Insert Title", text: $titleInput)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.words)
            Button("Save") {
                title = titleInput
                titleInput = ""
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TextFieldViewExamples()
}
