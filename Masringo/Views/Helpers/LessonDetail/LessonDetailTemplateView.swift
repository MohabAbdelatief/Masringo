//
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import SwiftUI

struct LessonDetailTemplateView<CardContent: View>: View {
    let lesson: LessonItem
    @ViewBuilder var cardBuilder: (LessonCard) -> CardContent

    @EnvironmentObject var languageManager: LanguageManager
    @State private var currentIndex = 0

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                LessonHeaderView(lesson: lesson)
                    .padding(.top)

                Spacer()

                if !lesson.cards.isEmpty {
                    cardBuilder(lesson.cards[currentIndex])
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.systemBackground))
                                .shadow(
                                    color: .black.opacity(0.1),
                                    radius: 8,
                                    x: 0,
                                    y: 5
                                )
                        )
                        .padding(.horizontal)
                        .transition(.slide)
                        .animation(.easeInOut, value: currentIndex)
                }

                Spacer()
            }

            VStack {
                Spacer()
                NavigationButtonsView(
                    currentIndex: $currentIndex,
                    totalCount: lesson.cards.count
                )
                .padding(.horizontal)
                .padding(.bottom, 24)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LessonHeaderView: View {
    let lesson: LessonItem
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: lesson.image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)

            Text(localized(lesson.name, with: languageManager))
                .font(.title)
                .bold()
        }
        .padding(.horizontal)
    }
}

struct NavigationButtonsView: View {
    @Binding var currentIndex: Int
    @State private var showCompletionAlert = false
    @EnvironmentObject var languageManager: LanguageManager

    let totalCount: Int

    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                if currentIndex > 0 {
                    currentIndex -= 1
                }
            }) {
                Text(localized("previous_button", with: languageManager))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(currentIndex <= 0)

            Button(action: {
                if currentIndex == totalCount - 1 {
                    showCompletionAlert = true
                } else {
                    currentIndex += 1
                }
            }) {
                Text(localized("next_button", with: languageManager))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .sheet(isPresented: $showCompletionAlert) {
                LessonCompleteView()
            }

        }
    }
}

struct LessonCompleteView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {

        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.green)

                Text(localized("congratulations", with: languageManager))
                    .font(.largeTitle)
                    .bold()

                Text(localized("message", with: languageManager))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Button(action: {
                    dismiss()
                }) {
                    Text(localized("close", with: languageManager))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.top, 20)
                .padding(.horizontal)
            }
            .padding()
        }
    }
}
