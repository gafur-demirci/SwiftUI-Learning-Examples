//
//  VideoListItemView.swift
//  Africa
//
//  Created by Abdulgafur Demirci on 25.04.2025.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - PROPERTIES
    
    let video: Video

    // MARK: - BODY

    var body: some View {
      HStack(spacing: 10) {
        ZStack {
          Image(video.thumbnail)
            .resizable()
            .scaledToFit()
            .frame(height: 80)
            .clipShape(
                RoundedRectangle(cornerRadius: 9)
            )
          
          Image(systemName: "play.circle")
            .resizable()
            .scaledToFit()
            .frame(height: 32)
            .shadow(radius: 4)
        } //: ZSTACK
        
        VStack(alignment: .leading, spacing: 10) {
          Text(video.name)
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundColor(.accentColor)
          
          Text(video.headline)
            .font(.footnote)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
        } //: VSTACK
      } //: HSTACK
    }
}

#Preview {
    let videos: [Video] = Bundle.main.decode("videos.json")
    VideoListItemView(video: videos[0])
}
