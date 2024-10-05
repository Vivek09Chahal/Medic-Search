//
//  ContentView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 12/08/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            Tab("", systemImage: "magnifyingglass.circle") {
                mainView()
            }
            
            Tab("", systemImage: "figure.outdoor.soccer"){
                TipBarView()
            }
        }
    }
}
#Preview {
    ContentView()
}
