//
//  VideoData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 24.12.2024.
//

import SwiftUI
import Observation
import AVKit

@Observable class VideoData {
    var player: AVPlayer!
    
    init() {
        let bundle = Bundle.main
        if let videoURL = bundle.url(forResource: "videotrees", withExtension: "mp4") {
            player = AVPlayer(url: videoURL)
        }
    }
}
