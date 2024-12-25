//
//  MyViewController.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI
#if os(iOS)
struct MyViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> DetailViewController {
        let controller = DetailViewController()
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
#endif
