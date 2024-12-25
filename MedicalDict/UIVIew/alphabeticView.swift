//
//  alphabeticView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 12/25/24.
//

import SwiftUI

struct alphabeticView: View {
    
    var medicines: [Medicine]
    
    private var availableLetters: Set<Character> {
        Set(medicines.map { $0.medicineName.uppercased().first ?? " " })
    }
    
    var body: some View {
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
