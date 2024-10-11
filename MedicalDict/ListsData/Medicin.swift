//
//  ModelData2.swift
//  MedicalDict
//
//  Created by Vivek on 22/08/24.
//

import Foundation

struct Medicine: Codable, Hashable, Identifiable{
    var id: UUID = UUID()
    var medicineName: String
    var description: String
    var uses: [String]
    var sideEffects: [String]
    var howToUse: String
    var precautions: [String]
    var interactions: [String]
    var storageInstructions: String
    var warnings: String
    
    enum CodingKeys: String, CodingKey {
        case medicineName
        case description
        case uses
        case sideEffects
        case howToUse
        case precautions
        case interactions
        case storageInstructions
        case warnings
    }
}
