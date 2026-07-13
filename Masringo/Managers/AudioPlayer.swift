//
//  AudioPlayer.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 03/05/2025.
//

import Foundation
import AVFoundation

class AudioPlayer: ObservableObject {
    @Published var isPlaying = false
    @Published var currentAudio: String?
    private var player: AVAudioPlayer?

    func playAudio(fileName: String) {
        if isPlaying && currentAudio == fileName {
            player?.pause()
            isPlaying = false
            return
        }

        guard
            let url = Bundle.main.url(forResource: fileName, withExtension: nil)
        else {
            print("Audio file \(fileName) not found")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
            isPlaying = true
            currentAudio = fileName
        } catch {
            print("Error playing audio: \(error)")
        }
    }

    func stopAudio() {
        player?.stop()
        isPlaying = false
        currentAudio = nil
    }
}
