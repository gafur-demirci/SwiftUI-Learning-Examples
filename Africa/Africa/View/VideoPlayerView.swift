//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Abdulgafur Demirci on 25.04.2025.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    
    var videoSelected: String
    var videoTitle: String

    // MARK: - BODY

    var body: some View {
      VStack {
        VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
           // Text(videoTitle)
        }
        .overlay(
          Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            .padding(.top, 6)
            .padding(.horizontal, 8)
          , alignment: .topLeading
        )
      } //: VSTACK
      .accentColor(.accentColor)
      .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

#Preview {
    VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
}
