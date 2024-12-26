//
//  MultiplatformView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 25.12.2024.
//

import SwiftUI

struct MultiplatformView: View {
    
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            Button("Open Auxiliary Window") {
                openWindow(id: "mywindow")
            }
        }
        .frame(width: 500, height: 300)
//        NavigationSplitView(sidebar: {
//            MenuView()
//        }, detail: {
//            MacDetailView()
//        })
    }
}

#Preview {
    MultiplatformView()
}
