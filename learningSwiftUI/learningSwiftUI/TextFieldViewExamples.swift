//
//  TextFieldViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.07.2024.
//

import SwiftUI

enum FocusName: Hashable {
    case name
    case surname
}

struct TextFieldViewExamples: View {
    
    @FocusState var focusName: FocusName?
    @State private var title: String = "Default Title"
    @State private var nameInput: String = ""
    @State private var surnameInput: String = ""
    
    var body: some View {
        VStack{
            Text(title)
                .lineLimit(1)
                .padding()
                .background(Color.yellow)
            TextField("Insert Name", text: $nameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .name ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .name)
            TextField("Insert Surname", text: $surnameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .surname ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .surname)
            HStack {
                Spacer()
                Button("Save") {
                    title = nameInput + " " + surnameInput
                    // keyboard closed
                    focusName = nil
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
