//
//  TextFieldViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.07.2024.
//

import SwiftUI

class TextFieldViewData: ObservableObject {
    @Published var title: String = "Default Name"
    @Published var numberInput: String = ""
    var currentNumber = ""
}

struct TextFieldViewExamples: View {
    
    @State private var title: String = "Default Name"
    @State private var numberInput = ""
    
    var body: some View {
        VStack(spacing: 10){
            Text(title)
                .padding()
                .background(Color.yellow)
            TextField("Insert Number", text: $numberInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .keyboardType(.numbersAndPunctuation)
                .onChange(of: numberInput, initial: false){ old, value in
                    if !value.isEmpty && Int(value) == nil {
                        numberInput = old
                    }
                }
            HStack {
                Spacer()
                Button("Save") {
                    title = numberInput
                    numberInput = ""
                }
                
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TextFieldViewExamples()
}
