//
//  ExerciseCardView.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 03/05/2025.
//

import SwiftUI

struct ExerciseCardView: View {
    let card: LessonCard
    @State private var selectedAnswer: String = ""
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {
        VStack(spacing: 8) {
            if let imageKey = card.image, !imageKey.isEmpty {
                Image(localized(imageKey, with: languageManager))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .cornerRadius(10)
            }
            
            Text(localized(card.text, with: languageManager))
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
            
            if let options = card.options {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(options, id: \.self) { optionKey in
                        let localizedOption = localized(optionKey, with: languageManager)
                        Button(action: {
                            selectedAnswer = optionKey
                        }) {
                            Text(localizedOption)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(selectedAnswer == optionKey ? Color.blue.opacity(0.2) : Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                )
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    ExerciseCardView(card: LessonCard(
        image: "exercise1_slide1_image",
        text: "exercise1_slide1_text",
        audio: nil,
        options: [
            "exercise1_slide1_option1",
            "exercise1_slide1_option2",
            "exercise1_slide1_option3"
        ]
    ))
    .environmentObject(LanguageManager())
}
