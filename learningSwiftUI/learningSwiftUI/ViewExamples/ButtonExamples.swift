//
//  ContentView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 28.04.2024.
//

import SwiftUI

struct MyStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let pressed = configuration.isPressed
        return configuration.label
            .padding()
            .border(Color.green, width: 5)
            .scaleEffect(pressed ? 1.2 : 1.0)
    }
}

struct ButtonExamples: View {
    
    @State private var colorActive: Bool = false
    @State private var color = Color.gray
    @State private var buttonDisabled = false
    @State private var expanded: Bool = false
    
    var body: some View {
        VStack {
            Text("Default Title")
                .padding()
                .foregroundStyle(color)
            Button("Change Color") {
                color = Color.green
            }
            .buttonStyle(MyStyle())
            Spacer()
        }
        .padding()
    }
    
    func changeColor() {
        colorActive.toggle()
    }
}

#Preview {
    ButtonExamples()
}
