//
//  MyTextView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI

#if os(iOS)
struct MyTextView: UIViewRepresentable {
    @Binding var input: String
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.backgroundColor = .yellow
        view.font = .systemFont(ofSize: 17)
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = input
    }
    
    func makeCoordinator() -> CoordinatorTextView {
        return CoordinatorTextView(input: $input)
    }
}

class CoordinatorTextView: NSObject, UITextViewDelegate {
    @Binding var inputCoordinator: String
    
    init(input: Binding<String>) {
        self._inputCoordinator = input
    }
    
    func textViewDidChange(_ textView: UITextView) {
        inputCoordinator = textView.text
    }
}
#endif
