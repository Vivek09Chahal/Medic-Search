//
//  Content.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            Tab("", systemImage: "gamecontroller.circle.fill") {
                GameView()
            }
            
            Tab("", systemImage: "magnifyingglass.circle") {
                mainView()
            }
        }
    }
}
#Preview {
    ContentView()
}
