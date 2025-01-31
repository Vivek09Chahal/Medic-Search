//
//  gameVariables.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import Foundation

struct Game: Codable, Hashable, Identifiable {
    var id = UUID()
    let question: String
    let answer: [String]
    let correctAnswer: String
    
    enum CodingKeys: String, CodingKey {
        case question
        case answer = "answers" // Match the JSON key
        case correctAnswer
    }
}
