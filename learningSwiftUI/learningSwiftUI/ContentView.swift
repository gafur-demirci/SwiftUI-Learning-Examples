//
//  ContentView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 28.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var colorActive: Bool = false
    
    var body: some View {
        VStack {
//            HeaderView(title: title, titleInput: $titleInput)
            Text("Default Title")
                .padding()
                .background(colorActive ? Color.green : Color.clear)
            Button("Change Color"){
                colorActive.toggle()
            }
            Spacer()
        }
        .padding()
    }
    
    func changeColor() {
        colorActive.toggle()
    }
}

//struct HeaderView: View {
//    
//    var title: String
//    @Binding var titleInput: String
//    
//    var body: some View {
//        VStack{
//            Text(title)
//                .padding(10)
//            TextField("Insert Title", text: $titleInput)
//                .textFieldStyle(.roundedBorder)
//        }
//    }
//}

#Preview {
    ContentView()
}
