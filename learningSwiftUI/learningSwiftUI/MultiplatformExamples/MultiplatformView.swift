//
//  MultiplatformView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 25.12.2024.
//

import SwiftUI

struct MultiplatformView: View {
    
    @Environment(MacData.self ) private var macData
    @SceneStorage("selection") var selection: Int = 0
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 20) {
                Picker("Select", selection: $selection) {
                    ForEach(macData.foodList.indices, id: \.self) { index in
                        Button(macData.foodList[index].capitalized, action: {
                            selection = index
                        })
                        .tag(index)
                    }
                }
                .frame(width: 200, height: 150, alignment: .top)
                Image(macData.foodList[selection])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 150)
            }
//            Text("Hello, World!")
//            Button("Open Auxiliary Window") {
//                openWindow(id: "mywindow")
//            }
        }
        .padding(20)
//        .frame(width: 500, height: 300)
//        NavigationSplitView(sidebar: {
//            MenuView()
//        }, detail: {
//            MacDetailView()
//        })
    }
}

#Preview {
    MultiplatformView()
        .environment(MacData())
}
