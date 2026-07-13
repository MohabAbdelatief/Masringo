//
//  ExerciseDetailView.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 03/05/2025.
//

import SwiftUI

struct ExerciseDetailView: View {
    let lesson: LessonItem

    var body: some View {
        LessonDetailTemplateView(lesson: lesson) { card in
            ExerciseCardView(card: card)
        }
    }
}
