//
//  AudioLessonDetailView.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 03/05/2025.
//

import SwiftUI

struct AudioLessonDetailView: View {
    let lesson: LessonItem

    var body: some View {
        LessonDetailTemplateView(lesson: lesson) { card in
            AudioLessonCardView(card: card)
        }
    }
}

#Preview {
    AudioLessonDetailView(lesson: LessonItem(
        audio: "Sample Audio",
        image: "speaker.wave.2.fill",
        cards: [
            LessonCard(image: "sample_image_1", text: "Sample text 1", audio: "sample1.mp3"),
            LessonCard(image: "sample_image_2", text: "Sample text 2", audio: "sample2.mp3")
        ]
    ))
    .environmentObject(LanguageManager())
}
