//
//  ToggleViewExamples.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 17.07.2024.
//

import SwiftUI

struct MyToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center) {
            configuration.label
            Spacer()
            Image(systemName: "checkmark.rectangle.fill")
                .font(.largeTitle)
                .foregroundColor(configuration.isOn ? Color.green : Color.gray)
                .onTapGesture {
                    configuration.$isOn.wrappedValue.toggle()
                }
        }
    }
}

struct ToggleViewExamples: View {
    
    @State private var currentState: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Toggle(currentState ? "Enabled" : "Disabled", isOn: $currentState)
                    .toggleStyle(MyToggleStyle())
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ToggleViewExamples()
}
