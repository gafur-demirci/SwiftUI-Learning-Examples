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
            List {
                ForEach(webData.listOfPosts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .bold()
                        Text(post.body)
                    }
                    .padding(5)
                }
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    WebViewExample()
        .environment(WebData())
}
