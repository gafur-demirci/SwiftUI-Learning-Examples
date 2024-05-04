//
//  ContentView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 28.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var title: String = "Default Title"
    @State private var titleInput: String = ""
    
    var body: some View {
        VStack {
            Text(title)
                .padding(10)
            TextField(
                "Enter the title",
                text: $titleInput
            )
            .font(.headline)
            .padding(10)
            .textFieldStyle(.roundedBorder)
            HStack {
                Spacer()
                Button(action: {
                    title = titleInput
                    titleInput = ""
                }, label: {
                    Text("Change Title")
                })
                .buttonStyle(.bordered)
                Spacer()
                Button(action: {
                    title = "Default Title"
                    titleInput = ""
                }, label: {
                    Text("Reset Title")
                })
                .buttonStyle(.bordered)
                .tint(.red)
                .foregroundStyle(.blue)
//                .background(.purple)
                Spacer()
            }
           Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
