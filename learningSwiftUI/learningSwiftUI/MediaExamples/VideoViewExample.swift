//
//  VideoViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 24.12.2024.
//

import SwiftUI
import AVKit

struct VideoViewExample: View {
    
    @Environment(VideoData.self) private var videoData
    
    var body: some View {
        if videoData.player != nil {
            VideoPlayer(player: videoData.player!)
                .onAppear {
                    videoData.player?.play()
                }
                .ignoresSafeArea()
        } else {
            Text("Video not available")
        }
    }
}

#Preview {
    VideoViewExample()
        .environment(VideoData())
}
