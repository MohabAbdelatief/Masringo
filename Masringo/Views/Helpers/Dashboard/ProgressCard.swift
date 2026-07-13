//
//  ProgressCard.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import SwiftUI

struct ProgressCard: View {
    @EnvironmentObject var languageManager: LanguageManager
    var progress: Double

    var body: some View {
        VStack(alignment: .leading) {
            Text(localized("lessons_progress", with: languageManager))
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .tint(.yellow)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(.systemBackground))
                .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
        )
    }
}

#Preview {
    ProgressCard(progress: 0.5)
        .environmentObject(LanguageManager())

}
