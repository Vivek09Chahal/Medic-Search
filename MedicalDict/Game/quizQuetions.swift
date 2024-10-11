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

func loadGameJsonData() -> [game] {
    guard let url = Bundle.main.url(forResource: "gameData", withExtension: "json")
    else {
        fatalError("Failed to locate medicineData.json in bundle.")
    }
    
    guard let data = try? Data(contentsOf: url)
    else {
        fatalError("Failed to load medical.json from bundle.")
    }
    
    let decoder = JSONDecoder()
    guard let text = try? decoder.decode([game].self, from: data)
    else {
        fatalError("Failed to decode medical.json from bundle.")
    }
    
    return text
}
