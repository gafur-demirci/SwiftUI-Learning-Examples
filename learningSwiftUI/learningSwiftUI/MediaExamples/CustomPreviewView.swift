//
//  CustomPreviewView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 24.12.2024.
//

import SwiftUI
import AVFoundation

class CustomPreviewView: UIView {
    // return video layer
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
}

struct CustomPreview: UIViewRepresentable {
    let view = CustomPreviewView()
    
    func makeUIView(context: Context) -> UIView {
        view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) { }
}
