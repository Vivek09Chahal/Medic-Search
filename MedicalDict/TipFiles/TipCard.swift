//
//  TipCard.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 11/15/24.
//

import SwiftUI

struct TipCard: View {
    let tip: DailyTip
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Icon
            Image(systemName: tip.icon)
                .font(.system(size: 60))
                .foregroundStyle(.linearGradient(
                    colors: [.white, .blue.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .scaleEffect(isAnimating ? 1.1 : 1)
                .animation(.easeInOut(duration: 1).repeatForever(), value: isAnimating)
            
            // Tip Title
            Text(tip.title)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            // Tip Description
            Text(tip.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(radius: 10)
        .onAppear {
            isAnimating = true
        }
    }
}
