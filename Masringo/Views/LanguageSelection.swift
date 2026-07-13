//
//  LanguageSelection.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import SwiftUI

struct LanguageSelection: View {
    @EnvironmentObject var languageManager: LanguageManager
    @AppStorage("hasSelectedLanguage") private var hasSelectedLanguage = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white, Color.blue.opacity(0.2),
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                Text("Select a Language")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)

                VStack(spacing: 20) {
                    Image("flag.uk")
                        .resizable()
                        .scaledToFit()
                        
                        .cornerRadius(12)
                    Button {
                        languageManager.language = "en"
                        hasSelectedLanguage = true
                    } label: {
                        Text("English")
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.5))
                    .foregroundColor(.black)
                    .cornerRadius(12)

                    Image("flag.sp")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                    Button {
                        languageManager.language = "es"
                        hasSelectedLanguage = true
                    } label: {

                        Text("Español")
                            .bold()

                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.5))
                    .foregroundColor(.black)
                    .cornerRadius(12)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(radius: 10)
            }
            .padding()
        }
    }
}

#Preview {
    LanguageSelection()
        .environmentObject(LanguageManager())
}
