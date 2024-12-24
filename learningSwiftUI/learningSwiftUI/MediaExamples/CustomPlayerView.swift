//
//  CustomPlayerView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 24.12.2024.
//

import SwiftUI
import AVFoundation

class CustomPlayerView: UIView {
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}

struct PlayerView: UIViewRepresentable {
    var view = CustomPlayerView()
    
    func makeUIView(context: Context) -> CustomPlayerView {
        return view
    }
    
    func updateUIView(_ uiView: CustomPlayerView, context: Context) { }
}
