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
            
            Tab("", systemImage: "figure.yoga") {
                yogaView()
            }
            
            Tab("", systemImage: "gamecontroller") {
                GameView()
            }
            
            Tab("", systemImage: "magnifyingglass") {
                mainView()
            }
        }
    }
}

#Preview {
    ContentView()
}
