//
//  correctQuestionView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 12/25/24.
//

import SwiftUI

struct correctQuestionView: View {
    @State private var isAnimated = false
    @State private var autoDismissTask: DispatchWorkItem?
    let tip = DailyTips.tips.randomElement()!
    var onNext: () -> Void
    
    var body: some View {
        ZStack {
            
            VStack {
                VStack(spacing: 20) {
                    Image(systemName: tip.icon)
                        .font(.system(size: 70))
//                        .foregroundColor(.yellow)
                        .symbolRenderingMode(.multicolor)
                    
                    Text(tip.title)
                        .foregroundStyle(.primary)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text(tip.description)
                        .foregroundStyle(.primary)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .frame(width: 500)
                    
                    Button(action: onNext) {
                        Text("Next Question")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.2, green: 0.5, blue: 0.8),
                                        Color(red: 0.3, green: 0.6, blue: 0.9)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(25)
                    }
                    .padding(.top, 30)
                }
                .scaleEffect(isAnimated ? 1 : 0.5)
                .opacity(isAnimated ? 1 : 0)
                .background{
                    RoundedRectangle(cornerRadius: 45.0)
                        .frame(width: 530, height: 570)
                        .foregroundStyle(.tertiary)
                }
                .onAppear {
                    // Cancel any existing timer
                    autoDismissTask?.cancel()
                    
                    // Animate only once
                    if !isAnimated {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                            isAnimated = true
                        }
                    }
                    
                    // Create new auto-dismiss timer
                    let task = DispatchWorkItem {
                        onNext()
                    }
                    autoDismissTask = task
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7, execute: task)
                }
                .onDisappear {
                    // Clean up timer when view disappears
                    autoDismissTask?.cancel()
                    autoDismissTask = nil
                }
            }
        }
    }
}

#Preview {
    correctQuestionView(onNext: {})
}
