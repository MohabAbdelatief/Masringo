//
//  AudioLessonSection.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import SwiftUI

struct AudioLessonSection: View {
    let audioLessons: [LessonItem]
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        VStack(alignment: .leading) {
            Text(localized("title_listening_lessons", with: languageManager))
                .font(.title2)
                .bold()
                .padding(.top)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(audioLessons, id: \.name) { audioLesson in
                        NavigationLink(
                            destination: AudioLessonDetailView(
                                lesson: audioLesson
                            )
                        ) {
                            LessonCell(lesson: audioLesson)
                        }
                    }
                }
                .padding(.all, 4)
            }
        }
    }
}

#Preview {
    AudioLessonSection(audioLessons: [
        LessonItem(
            audio: "audio_letters",
            image: "speaker.wave.2.fill",
            cards: [
                LessonCard(
                    image: "letters_audio_card1",
                    text: "Letter Sounds",
                    audio: "letters_audio1.mp3"
                )
            ]
        )
    ])
    .environmentObject(LanguageManager())
}
