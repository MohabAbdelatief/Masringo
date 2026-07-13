//
//  LessonSection.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import SwiftUI

struct LessonSection: View {
    let lessons: [LessonItem]
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(localized("title_lessons", with: languageManager))
                .font(.title2)
                .bold()
                .padding(.top)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(lessons, id: \.name) { lesson in
                        NavigationLink(destination: LessonDetailView(lesson: lesson)) {
                            LessonCell(lesson: lesson)
                        }
                    }
                }
                .padding(.all, 4)
            }
        }
    }
}

#Preview {
    LessonSection(lessons: [LessonItem(name: "lesson_pronunciation", image: "waveform")])
        .environmentObject(LanguageManager())
}
