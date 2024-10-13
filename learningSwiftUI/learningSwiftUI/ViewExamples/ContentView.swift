//
//  ContentView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.07.2024.
//

import SwiftUI

@Observable class ViewData {
    var titleInput: String = ""
    @ObservationIgnored var counter: Int = 0
}

struct ContentView: View {
    @Bindable var viewData = ViewData()
    // Bindable for two way model data updating
    // var appData = ApplicationData()
    @Environment(ApplicationMyData.self) private var appData
    // use appData in viewData prop shows - first way
//    init() {
//        viewData.titleInput = appData.title
//    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(appData.title)
                .padding(10)
            TextField("Insert Title", text: $viewData.titleInput)
                .textFieldStyle(.roundedBorder)
            Button(action: {
                appData.title = viewData.titleInput
                viewData.titleInput = ""
                viewData.counter += 1
                print("Current counter: \(viewData.counter)")
            }, label: {
                Text("Save")
            })
            Spacer()
        }
        .padding()
        // use appData in viewData prop shows - second way
        .onAppear() {
            viewData.titleInput = appData.title
        }
    }
}

#Preview {
    ContentView()
        .environment(ApplicationMyData())
}
