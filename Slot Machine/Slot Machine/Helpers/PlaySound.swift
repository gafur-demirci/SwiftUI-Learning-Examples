//
//  PlaySound.swift
//  Slot Machine
//
//  Created by Abdulgafur Demirci on 4.05.2025.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    guard let path = Bundle.main.path(forResource: sound, ofType: type) else { return }
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
        audioPlayer?.play()
    } catch {
        print("Error playing sound: \(error)")
    }
}
