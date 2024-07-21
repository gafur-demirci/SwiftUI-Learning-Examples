//
//  ContentView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    var appData = ApplicationData()
    
    var body: some View {
        VStack {
            Text(appData.title)
                .padding(10)
            Button(action: {
                appData.title = "New Title"
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
