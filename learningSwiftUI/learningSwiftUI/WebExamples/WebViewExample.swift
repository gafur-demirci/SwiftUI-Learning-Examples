//
//  WebViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI

class WebViewData: ObservableObject {
    @Published var url: String = ""
}

struct WebViewExample: View {
    @ObservedObject var webViewData: WebViewData = WebViewData()
    var webview: WebView!
    
    init() {
        webview = WebView(url: $webViewData.url)
    }
    
//    @State private var searchURL: URL = URL(string: "https://www.softtech.com.tr")!
//    @State private var openSheet: Bool = false
//    @State private var disableButton: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Insert URL", text: $webViewData.url)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled(true)
                Button("Load") {
                    let text = webViewData.url.trimmingCharacters(in: .whitespaces)
                    if !text.isEmpty {
                        webview.loadWeb(web: text)
                    }
                }
            }
            .padding(5)
            webview
        }
//        WebView(url: searchURL)
        /*
        VStack {
            Button("Open Browser") {
                openSheet = true
            }
            .buttonStyle(.borderedProminent)
            .disabled(disableButton)
            Spacer()
        }
        .padding()
        .sheet(isPresented: $openSheet, content: {
            SafariBrowser(disable: $disableButton ,url: $searchURL)
        })
         */
    }
}

#Preview {
    WebViewExample()
}
