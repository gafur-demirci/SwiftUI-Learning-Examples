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
                .submitLabel(.continue)
                .onSubmit {
                    assignTitle()
                }
                .textInputAutocapitalization(.words)
            HStack {
                Spacer()
                Button("Save") {
                    assignTitle()
                }
            }
            Spacer()
        }
        .padding()
    }
    
    func assignTitle() {
        title = titleInput
        titleInput = ""
    }
}

#Preview {
    TextFieldViewExamples()
}
