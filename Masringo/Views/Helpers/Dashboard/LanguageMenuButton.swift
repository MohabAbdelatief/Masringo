//
//  LanguageMenuButton.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import SwiftUI

struct LanguageMenuButton: View {
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        Menu {
            Button {
                withAnimation(.easeInOut(duration: 0.3)) {
                    languageManager.language = "en"
                }
            } label: {
                Label("English", image: "flag.uk")
            }

            Button {
                withAnimation(.easeInOut(duration: 0.3)) {
                    languageManager.language = "es"
                }
            } label: {
                Label("Español", image: "flag.sp")
            }
        } label: {
            HStack(spacing: 4) {
                Image(languageManager.language == "es" ? "flag.sp" : "flag.uk")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)

                Image(systemName: "chevron.down")
                    .font(.footnote)
                    .foregroundColor(.primary)
            }
        }
    }
}
