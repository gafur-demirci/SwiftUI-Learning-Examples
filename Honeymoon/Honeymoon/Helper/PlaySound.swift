//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Abdulgafur Demirci on 6.05.2025.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error)")
        }
    }
}
