//
//  CustomPlayerData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 24.12.2024.
//

import SwiftUI
import Observation
import AVFoundation

class PlayerViewData: NSObject {
    @Published var player: AVPlayer?
    @Published var playerItem: AVPlayerItem?
    @Published var playerObservation: NSKeyValueObservation?
    @Published var playerLayer: AVPlayerLayer?
    
    //    func setObserver() {
    //        playerObservation = playerItem?.observe(\.status, options: [.new], changeHandler: { item, value in
    //                if item.status == .readyToPlay {
    //                    self.player?.play()
    //            }
    //        })
    //    }
}

@Observable class CustomPlayerData {
    
    var playing: Bool = false
    var progress: CGFloat = 0
    
    @ObservationIgnored var customVideoView: PlayerView!
    @ObservationIgnored var viewData: PlayerViewData
    
    init() {
        customVideoView = PlayerView()
        viewData = PlayerViewData()
        
        let bundle = Bundle.main
        let url = bundle.url(forResource: "videotrees", withExtension: "mp4")
        
        let asset = AVURLAsset(url: url!)
        viewData.playerItem = AVPlayerItem(asset: asset)
        viewData.player = AVPlayer(playerItem: viewData.playerItem)
        
        viewData.playerLayer = customVideoView.view.layer as? AVPlayerLayer
        viewData.playerLayer?.player = viewData.player
        
        let interval = CMTime(value: 1, timescale: 2)
        viewData.player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { time in
            if let duration = self.viewData.playerItem?.duration {
                let position = time.seconds / duration.seconds
                self.progress = CGFloat(position)
            }
        })
    }
    
    func playVideo() {
        if viewData.playerItem?.status == .readyToPlay {
            if playing {
                viewData.player?.pause()
                playing = false
            } else {
                viewData.player?.play()
                playing = true
            }
        }
    }
}
