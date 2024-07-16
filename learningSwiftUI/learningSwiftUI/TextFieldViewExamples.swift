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
        VStack(spacing: 10){
            Text(title)
                .lineLimit(1)
                .padding()
                .background(Color.yellow)
            TextField("Insert Name", text: $nameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .name ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .name)
                .onChange(of: nameInput, initial: false){ old, value in
                    if value.count > 10 {
                        nameInput = String(value.prefix(10))
                    }
                }
            TextField("Insert Surname", text: $surnameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .surname ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .surname)
                .onChange(of: surnameInput, initial: false){ old, value in
                    if value.count > 15 {
                        surnameInput = String(value.prefix(15))
                    }
                }
            HStack {
                Spacer()
                Button("Save") {
                    let tempName = nameInput.trimmingCharacters(in: .whitespaces)
                    let tempSurname = surnameInput.trimmingCharacters(in: .whitespaces)
                    
                    if !tempName.isEmpty && !tempSurname.isEmpty {
                        title = nameInput + " " + surnameInput
                        // keyboard closed
                        focusName = nil
                    }
                }
                .disabled(nameInput.isEmpty || surnameInput.isEmpty)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TextFieldViewExamples()
}
