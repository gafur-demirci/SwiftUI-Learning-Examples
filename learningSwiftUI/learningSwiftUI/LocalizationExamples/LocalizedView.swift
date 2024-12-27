//
//  LocalizedView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 27.12.2024.
//

import SwiftUI

struct LocalizedView: View {
    
    @State private var myText = String(localized: "Hello, World!")
    
    var body: some View {
        VStack {
            Text(myText)
                .padding()
            Button("Change Text") {
                myText = String(localized: "Goodbye World!")
            }
            Spacer()
        }
    }
}

#Preview {
    LocalizedView()
}
