//
//  WebViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI

struct WebViewExample: View {
    
    @Environment(\.openURL) var openURL
    @State private var url = "https://www.softtech.com.tr"
    
    var body: some View {
        VStack {
            Button("Open URL") {
                if let url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                    openURL(URL(string: url)!)
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    WebViewExample()
}
