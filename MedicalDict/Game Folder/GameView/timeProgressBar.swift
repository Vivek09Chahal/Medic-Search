//
//  timeProgressBar.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 12/25/24.
//

import SwiftUI

func timerProgressBar(timeRemain: Double, maxWidth: CGFloat) -> some View {
    ZStack(alignment: .leading) {
        Capsule()
            .fill(.ultraThinMaterial)
            .frame(width: .infinity, height: 8)
        
        Capsule()
            .fill(
                LinearGradient(
                    colors: [
                        timeRemain > 7 ? .green : (timeRemain > 3 ? .orange : .red),
                        timeRemain > 7 ? .green.opacity(0.7) : (timeRemain > 3 ? .orange.opacity(0.7) : .red.opacity(0.7))
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(width: max(0, CGFloat(timeRemain / 10) * maxWidth), height: 8)
            .animation(.linear, value: timeRemain)
    }
    .padding(.horizontal)
}
