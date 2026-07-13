//
//  LanguageManager.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import Foundation

class LanguageManager: ObservableObject {
    @Published var language: String {
        didSet {
            UserDefaults.standard.set(language, forKey: "language")
        }
    }

    init() {
        self.language = UserDefaults.standard.string(forKey: "language") ?? "en"
    }
}

extension Bundle {
    static func localizedBundle(for language: String) -> Bundle {
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return .main
        }
        return bundle
    }
    
    static func localizedString(for key: String) -> String {
        let lang = UserDefaults.standard.string(forKey: "language") ?? "en"
        return localizedBundle(for: lang).localizedString(forKey: key, value: nil, table: nil)
    }
}

func localized(_ key: String, with manager: LanguageManager) -> String {
    Bundle.localizedBundle(for: manager.language)
        .localizedString(forKey: key, value: nil, table: nil)
}

