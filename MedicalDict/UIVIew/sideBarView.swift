//
//  sideBarView.swift
//  MedicalDict
//
//  Created by Vivek on 04/10/24.
//

import SwiftUI

struct mainView: View {
    @State private var medicines: [Medicine] = loadMedicineJSONData()
    @State private var searchText: String = ""
    @State private var searchIsActive = false
    @State var selectedMedicine: Medicine?
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.white, .blue.opacity(0.2)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                ScrollView {
                    VStack(spacing: 20) {
                        // Search Bar
                        HStack {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.leading, 8)
                                
                                TextField("Search medicines...", text: $searchText)
                                    .foregroundColor(.black)
                                    .autocapitalization(.none)
                                
                                if !searchText.isEmpty {
                                    Button(action: { searchText = "" }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white.opacity(0.95))
                                    .shadow(color: .black.opacity(0.1), radius: 5)
                            )
                        }
                        .padding(.horizontal)
                        
                        // Alphabet Grid
                        LazyVGrid(columns: [
                            GridItem(.adaptive(minimum: 40))
                        ], spacing: 20) {
                            ForEach(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ"), id: \.self) { letter in
                                NavigationLink(destination: MedicinesForLetterView(
                                    letter: letter,
                                    medicines: medicines.filter {
                                        $0.medicineName.uppercased().hasPrefix(String(letter))
                                    }
                                )) {
                                    Text(String(letter))
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

#Preview {
    mainView()
}
