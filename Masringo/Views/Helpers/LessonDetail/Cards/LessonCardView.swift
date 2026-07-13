//
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import SwiftUI

struct LessonCardView: View {
    let card: LessonCard
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        VStack(spacing: 16) {
            if let imageKey = card.image {
                let imageName = localized(imageKey, with: languageManager)
                if !imageName.isEmpty && imageName != "none" {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                }
            }
            
            Text(localized(card.text, with: languageManager))
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    LessonCardView(
        card: LessonCard(
            image: "lesson1_slide1_image",
            text: "lesson1_slide1_text",
            audio: nil
        )
    )
    .environmentObject(LanguageManager())
}
