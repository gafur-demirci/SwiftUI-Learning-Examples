//
//  CustomView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI

struct CustomView: View {
    
//    @State private var inputText: String = "Initial Text"
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Open UIKit View",
                               destination: {
                    MyViewController()
                })
                .buttonStyle(.borderedProminent)
                Spacer()
            }
        }
        /*
        VStack {
            HStack {
                Text(inputText)
                Spacer()
                Button("Clear") {
                    inputText = "" // change the state property, representable view (MyTextView) binding this update the MyTextView UI
                }
            }
            MyTextView(input: $inputText)
            */
//            MyCustomView()
//                .frame(width: 200, height: 200)
//                .padding()
//            Spacer()
//        }
        .padding()
    }
}

#Preview {
    CustomView()
}
