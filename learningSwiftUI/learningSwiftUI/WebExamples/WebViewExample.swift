//
//  WebViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI

struct WebViewExample: View {
    
    @Environment(\.openURL) var openURL
    @State private var url = ""
    
    var body: some View {
        VStack {
            TextField("Insert URL", text: $url)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .autocorrectionDisabled(true)
            Button("Open URL") {
                if !url.isEmpty {
                    var components = URLComponents(string: url)
                    components?.scheme = "https"
                    if let newURL = components?.string {
                        if let isValidURL = newURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                            openURL(URL(string: isValidURL)!)
                        }
                    }
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
