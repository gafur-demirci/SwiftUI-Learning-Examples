//
//  WebViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI

struct WebViewExample: View {
    
    @Environment(WebData.self ) private var webData
    
    var body: some View {
        VStack {
            Button("Load Web") {
                Task(priority: .high) {
                    await webData.loadWeb()
                }
            }
            .disabled(webData.buttonDisabled)
            Text("Total Characters: \(webData.webContent.count)")
                .padding()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    WebViewExample()
        .environment(WebData())
}
