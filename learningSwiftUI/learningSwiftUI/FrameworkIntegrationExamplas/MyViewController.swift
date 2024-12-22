//
//  MyViewController.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI

struct MyViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> DetailViewController {
        let controller = DetailViewController()
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
