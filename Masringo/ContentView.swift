//
//  ContentView.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 01/05/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var languageManager: LanguageManager
    var body: some View {
        TabView {
            Dashboard()
                .tabItem {
                    Image(systemName: "house")
                    Text(localized("title_dashboard", with: languageManager))
                }
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text(localized("explore", with: languageManager))
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text(localized("profile", with: languageManager))
                }
        }
        .tint(.blue)
        
    }
}

#Preview {
    ContentView()
        .environmentObject(LanguageManager())
}
