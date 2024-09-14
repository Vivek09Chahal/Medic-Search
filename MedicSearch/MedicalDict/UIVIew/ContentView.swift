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
            DictView()
                .tabItem { Image(systemName: "magnifyingglass") }
            
            CameraView()
                .tabItem { Image(systemName: "camera.viewfinder") }
        }
    }
}
#Preview {
    ContentView()
}
