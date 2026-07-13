//
//  MasringoApp.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 01/05/2025.
//

import SwiftUI
import SwiftData

@main
struct MasringoApp: App {
    @StateObject private var languageManager = LanguageManager()

    var body: some Scene {
        WindowGroup {
            AppEntry()
                .environmentObject(languageManager)
        }
    }
}
