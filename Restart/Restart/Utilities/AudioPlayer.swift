//
//  AudioPlayer.swift
//  Restart
//
//  Created by Abdulgafur Demirci on 18.04.2025.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    guard let path = Bundle.main.path(forResource: sound, ofType: type) else { return }
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path), fileTypeHint: type)
        audioPlayer?.play()
    } catch {
        print("Error playing sound: \(error)")
    }
}
