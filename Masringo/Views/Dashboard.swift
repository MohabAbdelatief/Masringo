import SwiftUI

struct Dashboard: View {
    @EnvironmentObject var languageManager: LanguageManager
    var progressValue: Double = 0.0

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(localized("welcome_message", with: languageManager))
                    .font(.title)
                    .bold()
                    .padding(.top, 3)

                ProgressCard(progress: progressValue)

                ScrollView(.vertical, showsIndicators: false) {
                    LessonSection(lessons: lessons)
                    AudioLessonSection(audioLessons: audioLessons)
                    ExerciseSection(exercises: exercises)
                }
            }
            .padding(.all)
            .navigationTitle(
                localized("title_dashboard", with: languageManager)
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    LanguageMenuButton()
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    ToolbarTrailingItems()
                }
            }

            Spacer()

        }

    }
}

#Preview {
    Dashboard()
        .environmentObject(LanguageManager())
}
