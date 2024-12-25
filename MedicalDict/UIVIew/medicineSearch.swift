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
    
    private var availableLetters: Set<Character> {
        Set(medicines.map { $0.medicineName.uppercased().first ?? " " })
    }
    
    var filteredMedicines: [Medicine] {
        if searchText.isEmpty {
            return []
        }
        return medicines.filter { $0.medicineName.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                // Background Image
                Image("description")
                    .resizable()
                    .frame(width: .infinity, height: .infinity)
                    .ignoresSafeArea()
                
                // Search Bar
                VStack(spacing: 16) {
                    
                    Text("Medicine Search")
                        .font(.title)
                        .padding()
                    
                    HStack {
                        Spacer()
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray)
                                .padding(.leading, 12)
                            
                            TextField("Search medicines...", text: $searchText)
                                .foregroundStyle(.black)
                                .autocapitalization(.none)
                                .textFieldStyle(PlainTextFieldStyle())
                            
                            if !searchText.isEmpty {
                                Button(action: { searchText = "" }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                        .frame(maxWidth: 400)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .shadow(color: .black.opacity(0.1), radius: 8)
                        )
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // Search Results
                    if !searchText.isEmpty {
                        ScrollView {
                            LazyVStack(spacing: 10) {
                                ForEach(filteredMedicines) { medicine in
                                    NavigationLink(destination: DescriptionPage(medicine: medicine)) {
                                        HStack {
                                            Text(medicine.medicineName)
                                                .foregroundStyle(.primary)
                                                .padding()
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .fill(Color(.systemBackground))
                                                        .shadow(color: .black.opacity(0.05), radius: 4)
                                                )
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                    } else {
                        
                        // Alphabet Grid
                        ScrollView {
                            LazyVGrid(columns: [
                                GridItem(.adaptive(minimum: 180))
                            ], spacing: 16) {
                                ForEach(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ"), id: \.self) { letter in
                                    let isAvailable = availableLetters.contains(letter)
                                    NavigationLink(destination: MedicinesForLetterView( letter: letter, medicines: medicines.filter { $0.medicineName.uppercased().hasPrefix(String(letter)) }
                                    )) {
                                        Text(String(letter))
                                            .font(.title)
                                            .foregroundColor(isAvailable ? .white : .gray)
                                            .frame(width: 60, height: 60)
                                            .background(
                                                RoundedRectangle(cornerRadius: 50)
                                                    .fill(isAvailable ? Color.blue : Color.secondary.opacity(0.9))
                                                    .shadow(color: isAvailable ? .black.opacity(0.3) : .clear, radius: 4)
                                            )
                                            .padding()
                                    }
                                    .disabled(!isAvailable)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    mainView()
}
