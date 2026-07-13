//
//  LessonData.swift
//  Masringo
//
//

import Foundation

var lessons: [LessonItem] = [
    LessonItem(
        name: "lesson_pronunciation",
        image: "waveform",
        cards: [
            LessonCard(
                image: "lesson1_slide1_image",
                text: "lesson1_slide1_text",
                audio: nil
            )
        ]
    )
]

func generateLessonCards(for lessonNumber: Int, slideCount: Int) -> [LessonCard]
{
    return (1...slideCount).map { slideNumber in
        LessonCard(
            image: "audiolesson\(lessonNumber)_slide\(slideNumber)_image",
            text: "audiolesson\(lessonNumber)_slide\(slideNumber)_text",
            audio: "audiolesson\(lessonNumber)_slide\(slideNumber)_audio"
        )
    }
}

func generateExerciseCards(for exerciseNumber: Int, slideCount: Int) -> [LessonCard] {
    return (1...slideCount).map { slideNumber in
        let baseKey = "exercise\(exerciseNumber)_slide\(slideNumber)"
        return LessonCard(
            image: "\(baseKey)_image",
            text: "\(baseKey)_text",
            audio: nil,
            options: [
                "\(baseKey)_option1",
                "\(baseKey)_option2",
                "\(baseKey)_option3"
            ]
        )
    }
}

var audioLessons: [LessonItem] = [
    LessonItem(
        audio: "audio_letters",
        image: "speaker.wave.2.fill",
        cards: generateLessonCards(for: 1, slideCount: 21)
    ),
    LessonItem(
        audio: "audio_pronouns",
        image: "ear.fill",
        cards: generateLessonCards(for: 2, slideCount: 1)
    ),
    LessonItem(
        audio: "audio_article",
        image: "waveform.and.mic",
        cards: generateLessonCards(for: 3, slideCount: 4)
    ),
    LessonItem(
        audio: "audio_greetings",
        image: "person.wave.2.fill",
        cards: generateLessonCards(for: 4, slideCount: 1)
    ),
    LessonItem(
        audio: "audio_chat",
        image: "text.bubble.fill",
        cards: generateLessonCards(for: 5, slideCount: 3)
    ),
]

var exercises: [LessonItem] = [
    LessonItem(
        exercise: "exercise_letters",
        image: "waveform",
        cards: generateExerciseCards(for: 1, slideCount: 2)
    ),
    LessonItem(
        exercise: "exercise_pronouns",
        image: "person.2.fill",
        cards: generateExerciseCards(for: 2, slideCount: 7)
    ),
    LessonItem(
        exercise: "exercise_articles",
        image: "textformat.abc",
        cards: generateExerciseCards(for: 3, slideCount: 5)
    ),
    LessonItem(
        exercise: "exercise_greetings",
        image: "hands.sparkles.fill",
        cards: generateExerciseCards(for: 4, slideCount: 11)
    ),
    LessonItem(
        exercise: "exercise_chat",
        image: "quote.bubble.fill",
        cards: generateExerciseCards(for: 5, slideCount: 4) 
    )
]
