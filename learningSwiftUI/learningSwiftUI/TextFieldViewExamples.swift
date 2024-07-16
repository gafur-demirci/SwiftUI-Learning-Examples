//
//  TextFieldViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.07.2024.
//

import SwiftUI

struct TextFieldViewExamples: View {
    
    @State private var pass: String = ""
    
    var body: some View {
        VStack(spacing: 15){
            Text(pass)
                .padding()
            SecureField("Insert Password", text: $pass)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TextFieldViewExamples()
}
