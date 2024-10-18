//
//  quizQuetions.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

//
//  quizQuetions.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import Foundation
import SwiftUI

func loadGameJSONData() -> [Game] {
    guard let url = Bundle.main.url(forResource: "gameData", withExtension: "json") else {
        print("Failed to locate gameData.json in bundle.")
        return []
    }
    
    guard let data = try? Data(contentsOf: url) else {
        print("Failed to load gameData.json from bundle.")
        return []
    }
    
    let decoder = JSONDecoder()
    guard let questions = try? decoder.decode([Game].self, from: data) else {
        print("Failed to decode gameData.json from bundle.")
        return []
    }
    
    return questions
}