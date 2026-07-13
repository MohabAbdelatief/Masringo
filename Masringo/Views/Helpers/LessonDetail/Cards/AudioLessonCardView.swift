//
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import SwiftUI

struct AudioLessonCardView: View {
    let card: LessonCard
    @StateObject private var audioPlayer = AudioPlayer()
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        VStack {
            if let imageKey = card.image {
                let imageName = localized(imageKey, with: languageManager)
                if !imageName.isEmpty && imageName != "none" {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(25)
                }
            }

            Text(localized(card.text, with: languageManager))
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)

            if let audioKey = card.audio {
                let audioFile = localized(audioKey, with: languageManager) + ".mp3"
                Button(action: {
                    audioPlayer.playAudio(fileName: audioFile)
                }) {
                    HStack {
                        Image(systemName: audioPlayer.isPlaying && audioPlayer.currentAudio == audioFile ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        .padding(.all)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .onDisappear {
            audioPlayer.stopAudio()
        }
    }
}

#Preview {
    AudioLessonCardView(card: LessonCard(
        image: "audiolesson1_slide1_image",
        text: "audiolesson1_slide1_text",
        audio: "audiolesson1_slide1_audio"
    ))
    .environmentObject(LanguageManager())
}
