//
//  gameVariables.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import Foundation

struct game: Codable, Hashable, Identifiable{
    var id: UUID = UUID()
    var text: String
    var answer: [String]
    var correctAnswer: String
    
    enum CodingKeys: String, CodingKey {
        case text
        case answer
        case correctAnswer
    }
}

