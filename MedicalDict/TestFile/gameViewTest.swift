//
//  GAMEDATA.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 11/10/24.
//

import Foundation

func loadGameData() -> [game] {
    guard let url = Bundle.main.url(forResource: "GAMEDATA", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let gameData = try? JSONDecoder().decode([game].self, from: data) else {
        return []
    }
    return gameData
}
