//
//  Lesson.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import Foundation

enum LessonType {
    case lesson
    case audio
    case exercise
}
struct LessonCard {
    let image: String?
    let text: String
    let audio: String?
    let options: [String]?  // Optional for exercises

    init(
        image: String? = nil,
        text: String,
        audio: String? = nil,
        options: [String]? = nil
    ) {
        self.image = image
        self.text = text
        self.audio = audio
        self.options = options
    }
}

struct LessonItem {
    let name: String
    let image: String
    let type: LessonType
    let cards: [LessonCard]

    // Default initializer for lesson type
    init(name: String, image: String, cards: [LessonCard] = []) {
        self.name = name
        self.image = image
        self.type = .lesson
        self.cards = cards
    }

    // Initializer for audio type
    init(audio name: String, image: String, cards: [LessonCard] = []) {
        self.name = name
        self.image = image
        self.type = .audio
        self.cards = cards
    }

    // Initializer for exercise type
    init(exercise name: String, image: String, cards: [LessonCard] = []) {
        self.name = name
        self.image = image
        self.type = .exercise
        self.cards = cards
    }
}
