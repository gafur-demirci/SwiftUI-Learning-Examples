//
//  WebViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI

struct WebViewExample: View {
    
    @State private var url: String = ""
    @State private var backDisabled: Bool = true
    @State private var forwardDisabled: Bool = true
    @State private var webview: WebView!
    
    //    @State private var searchURL: URL = URL(string: "https://www.softtech.com.tr")!
    //    @State private var openSheet: Bool = false
    //    @State private var disableButton: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Insert URL", text: $url)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled(true)
                Button("Load") {
                    let text = url.trimmingCharacters(in: .whitespaces)
                    if !text.isEmpty {
                        webview.loadWeb(web: text)
                    }
                }
            }
            .padding(5)
            HStack {
                Button(action: {
                    webview.goBack()
                }, label: {
                    Image(systemName: "arrow.left.circle")
                        .font(.title)
                })
                .disabled(backDisabled)
                Button(action: {
                    webview.goForward()
                }, label: {
                    Image(systemName: "arrow.right.circle")
                        .font(.title)
                })
                .disabled(forwardDisabled)
                Spacer()
                Button(action: {
                    webview.refresh()
                }, label: {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.title)
                })
            }
            .padding(5)
            webview
        }
        .onAppear {
            webview = WebView(url: $url, back: $backDisabled, forward: $forwardDisabled)
        }
        
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

#Preview {
    WebViewExample()
}
