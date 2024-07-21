//
//  ContentView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.07.2024.
//

import SwiftUI

@Observable class ViewData {
    var titleInput: String = ""
}

struct ContentView: View {
    @Bindable var viewData = ViewData()
    // Bindable for two way model data updating
    var appData = ApplicationData()
    
    // use appData in viewData prop shows - first way
//    init() {
//        viewData.titleInput = appData.title
//    }
    
    var body: some View {
        VStack {
            Text(appData.title)
                .padding(10)
            TextField("Insert Title", text: $viewData.titleInput)
                .textFieldStyle(.roundedBorder)
            Button(action: {
                appData.title = viewData.titleInput
                viewData.titleInput = ""
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
}
