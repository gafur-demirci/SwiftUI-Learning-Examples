//
//  WebView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.12.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var url: String
    let view: WKWebView = WKWebView()
    
    func makeUIView(context: Context) -> WKWebView {
        view.navigationDelegate = context.coordinator
        let request = URLRequest(url: URL(string: "https://google.com")!)
        view.load(request)
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
    func loadWeb(web: String) {
        var components = URLComponents(string: web)
        components?.scheme = "https"
        if let newUrl = components?.string {
            if let url = newUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                if let loadUrl = URL(string: url) {
                    let request = URLRequest(url: loadUrl)
                    view.load(request)
                }
            }
        }
    }
    
    func makeCoordinator() -> CoordinatorWebView {
        return CoordinatorWebView(input: $url)
    }
}

class CoordinatorWebView: NSObject, WKNavigationDelegate {
    @Binding var input: String
    
    init(input: Binding<String>) {
        self._input = input
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let webURL = webView.url {
            input = webURL.absoluteString
        }
    }
}
