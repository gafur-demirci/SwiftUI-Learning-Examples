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
            VideoPlayer(player: videoData.player!, videoOverlay: {
                VStack {
                    Text("Title: Trees at the park")
                        .font(.title)
                        .padding([.top, .bottom], 8)
                        .padding([.leading, .trailing], 16)
                        .foregroundStyle(.black)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .padding(.top, 8)
                    Spacer()
                }
            })
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
