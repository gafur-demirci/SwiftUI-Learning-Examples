//
//  MyCustomView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI
#if os(iOS)
struct MyCustomView: UIViewRepresentable {
    // mandatory implemented func for UIViewRepresentable protocol
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    // mandatory implemented func for UIViewRepresentable protocol
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
#endif
