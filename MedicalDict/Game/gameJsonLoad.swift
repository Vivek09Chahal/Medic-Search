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

func loadGameJsonData(at index: Int) -> game? {
    guard let url = Bundle.main.url(forResource: "gameData", withExtension: "json") else {
        print("Failed to locate gameData.json in bundle.")
        return nil
    }
    
    guard let data = try? Data(contentsOf: url) else {
        print("Failed to load gameData.json from bundle.")
        return nil
    }
    
    let decoder = JSONDecoder()
    guard let gameData = try? decoder.decode([game].self, from: data) else {
        print("Failed to decode gameData.json from bundle.")
        return nil
    }
    
    guard index < gameData.count else {
        print("Index out of bounds.")
        return nil
    }
    
    return gameData[index]
}
