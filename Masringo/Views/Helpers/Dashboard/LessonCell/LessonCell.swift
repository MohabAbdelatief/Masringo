import SwiftUI

struct LessonCell: View {
    let lesson: LessonItem
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: lesson.image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)

            Text(localized(lesson.name, with: languageManager))
            .font(.body)
            .foregroundColor(.primary)
            .multilineTextAlignment(.center)
        }
        .padding()
        .frame(width: 140, height: 140)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
        )
    }
}

#Preview {
    LessonCell(
        lesson: LessonItem(
            name: "lesson_greetings",
            image: "hands.sparkles.fill"
        )
    )
    .environmentObject(LanguageManager())
}
