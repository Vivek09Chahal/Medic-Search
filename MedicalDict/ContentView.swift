//
//  Content.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var drugData = DrugData()
    var body: some View {
        TabView{
            
            Tab("", systemImage: "magnifyingglass") {
                mainView()
            }
            
            Tab("", systemImage: "pills") {
                DrugList(drugData: drugData)
            }
            
            Tab("", systemImage: "gamecontroller") {
                GameView()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
