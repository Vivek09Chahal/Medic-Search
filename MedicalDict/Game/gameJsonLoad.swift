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

func loadGameJSONData() -> [game] {
    guard let url = Bundle.main.url(forResource: "gameData", withExtension: "json")
    else {
        fatalError("Failed to locate gameData.json in bundle.")
    }
    
    guard let data = try? Data(contentsOf: url)
    else {
        fatalError("Failed to load gameData.json from bundle.")
    }
    
    let decoder = JSONDecoder()
    guard let question = try? decoder.decode([game].self, from: data)
    else {
        fatalError("Failed to decode gameData.json from bundle.")
    }
    
    return question
}

