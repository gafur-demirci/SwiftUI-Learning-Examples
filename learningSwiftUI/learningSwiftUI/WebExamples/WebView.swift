//
//  WebView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.12.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        let request = URLRequest(url: url)
        view.load(request)
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
