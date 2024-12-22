//
//  WebViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI

struct WebViewExample: View {
    
    @State private var searchURL: URL = URL(string: "https://www.softtech.com.tr")!
    @State private var openSheet: Bool = false
    
    var body: some View {
        VStack {
            Button("Open Browser") {
                openSheet = true
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
        .sheet(isPresented: $openSheet, content: {
            SafariBrowser(url: $searchURL)
        })
    }
}

#Preview {
    WebViewExample()
}
