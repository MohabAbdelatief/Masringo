//
//  AppEntry.swift
//  Masringo
//
//

import SwiftUI

struct AppEntry: View {
    @State private var showLaunchScreen = true
    @AppStorage("hasSelectedLanguage") private var hasSelectedLanguage = false

    var body: some View {
        ZStack {
            if showLaunchScreen {
                LaunchScreen()
                    .transition(.opacity.combined(with: .scale))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                showLaunchScreen = false
                            }
                        }
                    }
            } else if !hasSelectedLanguage {
                LanguageSelection()
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            } else {
                ContentView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: showLaunchScreen)
        .animation(.easeInOut(duration: 0.5), value: hasSelectedLanguage)
    }
}

#Preview {
    AppEntry()
        .environmentObject(LanguageManager())
}
