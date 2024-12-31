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
                    #if os(iOS)
                    MyViewController()
                    #endif
                })
                .buttonStyle(.borderedProminent)
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    CustomView()
}
