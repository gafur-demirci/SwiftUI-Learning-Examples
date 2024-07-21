//
//  ContentView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    // Bindable for two way model data updating
    @Bindable var appData = ApplicationData()
    
    var body: some View {
        VStack {
            Text(appData.title)
                .padding(10)
            TextField("Insert Title", text: $appData.titleInput)
                .textFieldStyle(.roundedBorder)
            Button(action: {
                appData.title = appData.titleInput
                appData.titleInput = ""
            }, label: {
                Text("Save")
            })
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
