//
//  LaunchScreen.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import SwiftUI

struct LaunchScreen: View {
    @Environment(\.colorScheme) var colorScheme

    var launchViewBackgroundGradient: LinearGradient {
        if colorScheme == .dark {
            return LinearGradient(
                gradient: Gradient(colors: [
                    Color.white,
                    Color.blue.opacity(0.2),
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        } else {
            return LinearGradient(
                gradient: Gradient(colors: [
                    Color.white,
                    Color.blue.opacity(0.2),
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }

    @State private var animate = false

    var animatedLogo: some View {
        VStack {
            Image("AppLogo")
                .resizable()
                .cornerRadius(40)
                .frame(width: 250, height: 250)
                .opacity(animate ? 1 : 0)
                .scaleEffect(animate ? 1 : 0.5)
                .animation(.easeOut(duration: 1), value: animate)
        }
    }

    var body: some View {
        ZStack {
            launchViewBackgroundGradient
                .ignoresSafeArea()
            animatedLogo
        }
        .onAppear {
            animate.toggle()
        }
    }
}

#Preview {
    LaunchScreen()
        .environmentObject(LanguageManager())
}
