//
//  LessonDetailView.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 03/05/2025.
//

import SwiftUI

struct LessonDetailView: View {
    let lesson: LessonItem

    var body: some View {
        LessonDetailTemplateView(lesson: lesson) { card in
            LessonCardView(card: card)
        }
    }
}
