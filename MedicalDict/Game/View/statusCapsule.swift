//
//  StatusCapsuke.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 12/25/24.
//

import SwiftUI

func statusCapsule(text: String, color: Color )-> some View {
    Capsule()
        .fill(.ultraThinMaterial)
        .frame(width: 120, height: 40)
        .overlay(
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(color)
        )
}
