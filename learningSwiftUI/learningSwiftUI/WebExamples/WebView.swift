//
//  WebView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.12.2024.
//

import SwiftUI
import WebKit
#if os(iOS)
struct WebView: UIViewRepresentable {
    @Binding var url: String
    @Binding var back: Bool
    @Binding var forward: Bool
    
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
    
    func goBack() {
        view.goBack()
    }
    
    func goForward() {
        view.goForward()
    }
    
    func refresh() {
        view.reload()
    }
    
    func makeCoordinator() -> CoordinatorWebView {
        return CoordinatorWebView(url: $url, back: $back, forward: $forward)
    }
}

class CoordinatorWebView: NSObject, WKNavigationDelegate {
    @Binding var url: String
    @Binding var backDisabled: Bool
    @Binding var forwordDisabled: Bool
    
    init(url: Binding<String>, back: Binding<Bool>, forward: Binding<Bool>) {
        self._url = url
        self._backDisabled = back
        self._forwordDisabled = forward
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let webURL = webView.url {
            url = webURL.absoluteString
            backDisabled = !webView.canGoBack
            forwordDisabled = !webView.canGoForward
        }
    }
}
#endif
