//
//  Dailytips.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 08/09/24.
//

//
//  Dailytips.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 08/09/24.
//

import Foundation

struct DailyTip: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
}

struct DailyTips {
    static let tips = [
        DailyTip(
            title: "Stay Hydrated",
            description: "Proper hydration helps maintain energy levels, supports digestion, and promotes healthy skin.",
            icon: "drop.fill"
        ),
        DailyTip(
            title: "Balanced Diet",
            description: "Incorporate a variety of fruits, vegetables, whole grains, lean proteins, and healthy fats into your meals.",
            icon: "leaf.fill"
        ),
        DailyTip(
            title: "Exercise Regularly",
            description: "Activities like walking, jogging, cycling, or even dancing can boost your mood and overall fitness.",
            icon: "figure.run"
        ),
        DailyTip(
            title: "Quality Sleep",
            description: "Aim for 7-9 hours of quality sleep each night. Good sleep helps improve concentration, mood, and overall health.",
            icon: "moon.stars.fill"
        ),
        DailyTip(
            title: "Mindfulness",
            description: "This can reduce stress, improve focus, and enhance emotional well-being.",
            icon: "brain.head.profile"
        ),
        DailyTip(
            title: "Healthy Eating",
            description: "Try to minimize consumption of processed foods, sugary drinks, and snacks.",
            icon: "leaf.circle.fill"
        ),
        DailyTip(
            title: "Good Posture",
            description: "Whether sitting or standing, maintaining good posture can prevent back and neck pain.",
            icon: "figure.stand"
        ),
        DailyTip(
            title: "Regular Breaks",
            description: "This prevents burnout and reduces strain on your body.",
            icon: "clock.fill"
        ),
        DailyTip(
            title: "Hand Hygiene",
            description: "Washing your hands frequently helps prevent the spread of germs and reduces your risk of infections.",
            icon: "hand.wave.fill"
        ),
        DailyTip(
            title: "Stay Connected",
            description: "Maintaining strong relationships with friends, family, and community can improve emotional well-being.",
            icon: "person.2.fill"
        ),
        DailyTip(
            title: "Healthy Choices",
            description: "Smoking and excessive alcohol consumption can have serious health consequences. Seek help if needed.",
            icon: "heart.fill"
        ),
        DailyTip(
            title: "Sun Protection",
            description: "Protect your skin from harmful UV rays by wearing sunscreen, even on cloudy days.",
            icon: "sun.max.fill"
        ),
        DailyTip(
            title: "Mental Exercise",
            description: "Engage in activities that challenge your brain, such as puzzles, reading, or learning a new skill.",
            icon: "brain.fill"
        ),
        DailyTip(
            title: "Stress Management",
            description: "Find healthy ways to manage stress, such as exercise, hobbies, or talking to a friend.",
            icon: "cloud.sun.fill"
        ),
        DailyTip(
            title: "Stay Organized",
            description: "Keeping your living and work spaces organized can reduce stress and improve productivity.",
            icon: "checkmark.square.fill"
        ),
        DailyTip(
            title: "Practice Gratitude",
            description: "Take time each day to reflect on things you are grateful for. This can improve your outlook on life.",
            icon: "heart.text.square.fill"
        ),
        DailyTip(
            title: "Stay Informed",
            description: "Keep up-to-date with reliable health information and guidelines from trusted sources.",
            icon: "info.circle.fill"
        ),
        DailyTip(
            title: "Regular Check-ups",
            description: "Regular medical check-ups can help detect and prevent health issues early.",
            icon: "cross.case.fill"
        ),
        DailyTip(
            title: "Safety First",
            description: "Follow safety guidelines and use protective gear when necessary to prevent injuries.",
            icon: "shield.fill"
        ),
        DailyTip(
            title: "Body Awareness",
            description: "Pay attention to your body's signals and rest when needed to avoid overexertion.",
            icon: "person.fill.checkmark"
        )
    ]
}
