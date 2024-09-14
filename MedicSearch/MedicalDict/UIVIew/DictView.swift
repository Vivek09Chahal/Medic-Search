//
//  DictView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 12/08/24.
//

import SwiftUI

struct DictView: View {
    
    @State private var searchText: String = ""
    let names = [""]
    
    @State private var searchIsActive = false
    
    var body: some View {
        NavigationStack{
            ListView()
            TipBarView()
                .foregroundStyle(.pink.gradient.opacity(2.0))
                .frame(maxHeight: 1000)
                .navigationTitle("Search Medicine")
        }
        .searchable(text: $searchText, isPresented: $searchIsActive, prompt: "Search Here")
        
        var searchResults: [String] {
            if searchText.isEmpty {
                return names
            } else {
                return names.filter { $0.contains(searchText) }
            }
        }
    }
}

#Preview {
    DictView()
}
