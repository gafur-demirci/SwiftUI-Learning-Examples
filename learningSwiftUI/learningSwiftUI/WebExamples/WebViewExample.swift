//
//  WebViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI

struct WebViewExample: View {
    
    @State private var url: URL? = URL(string: "https://softtech.com.tr")
    
    var body: some View {
        VStack {
            Link("Open Link", destination: url!)
                .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    WebViewExample()
}
