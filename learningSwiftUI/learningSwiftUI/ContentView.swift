//
//  ContentView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 28.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var colorActive: Bool = false
    @State private var color = Color.clear
    @State private var buttonDisabled = false
    @State private var expanded: Bool = false
    
    var body: some View {
        VStack {
//            HeaderView(title: title, titleInput: $titleInput)
//            Text("Default Title")
//                .padding()
//                .frame(minWidth: 0, maxWidth: expanded ? .infinity : 150, maxHeight: 50)
//                .background(Color.yellow)
//                .foregroundStyle(colorActive ? Color.black : Color.blue)
//            Button(action: {
//                expanded.toggle()
//            }, label: {
//                VStack {
//                    Image(expanded ? "contract" : "expand")
//                        .renderingMode(.template)
//                    Text(expanded ? "Contract" : "Expand")
//                }
//            })
//            .disabled(buttonDisabled)
//            HStack {
//                Button("Delete", role: .destructive) {
//                    print("Delete Action...")
//                }.buttonStyle(.bordered)
//                Spacer()
//                Button("Send") {
//                    print("Send Information")
//                }.buttonStyle(.borderedProminent)
//            }
            Button(action: {
                print("Delete item")
            }, label: {
                HStack {
                    Image(systemName: "mail")
                        .imageScale(.large)
                    Text("Send")
                }
            })
            .buttonStyle(.borderedProminent)
            .font(.largeTitle)
            .controlSize(.large)
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
