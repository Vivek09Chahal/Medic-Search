//
//  gameVariables.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import Foundation

struct Game: Decodable, Hashable, Identifiable {
    var id: UUID = UUID()
    var question: String
    var answer: [String]
    var correctAnswer: String
    
    
    enum CodingKeys1: String, CodingKey {
        case question
        case answer
        case correctAnswer
    }
}
