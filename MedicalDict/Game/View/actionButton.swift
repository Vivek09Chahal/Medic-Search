//
//  actionButton.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 12/25/24.
//

import SwiftUI

struct actionButton: View {
    let title: String
    let gradient: [Color]
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title3.bold())
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
                .background(
                    LinearGradient(colors: gradient,
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                )
                .foregroundColor(.white)
                .cornerRadius(25)
                .shadow(radius: 5)
        }
    }
}
