//
//  ExerciseSection.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import SwiftUI

struct ExerciseSection: View {
    let exercises: [LessonItem]
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(localized("title_exercises", with: languageManager))
                .font(.title2)
                .bold()
                .padding(.top)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(exercises, id: \.name) { exercise in
                        NavigationLink(destination: ExerciseDetailView(lesson: exercise)) {
                            LessonCell(lesson: exercise)
                        }
                    }
                }
                .padding(.all, 4)
            }
        }
    }
}

#Preview {
    ExerciseSection(exercises: [
        LessonItem(
            exercise: "exercise_letters",
            image: "waveform",
            cards: [
                LessonCard(image: "letters_exercise_card1", text: "Letter Identification", audio: nil)
            ]
        )
    ])
    .environmentObject(LanguageManager())
}
