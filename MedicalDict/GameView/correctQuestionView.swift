//
//  correctQuestionView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 12/25/24.
//

import SwiftUI

struct correctQuestionView: View {
    @State private var isAnimated = false
    let tip = DailyTips.tips.randomElement()!
    var onNext: () -> Void
    
    var body: some View {
        ZStack {
            Image("question")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 35.0)
                        .frame(width: 500, height: 550)
                        .foregroundStyle(Color.pearl)
                    
                    VStack(spacing: 20) {
                        Image(systemName: tip.icon)
                            .font(.system(size: 70))
                            .foregroundColor(.blue)
                        
                        Text(tip.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(tip.description)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .frame(width: 500)
                        
                        Button(action: onNext) {
                            Text("Next Question")
                                .font(.title3.bold())
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
                                .cornerRadius(25)
                        }
                        .padding(.top, 30)
                    }
                    .scaleEffect(isAnimated ? 1 : 0.5)
                    .opacity(isAnimated ? 1 : 0)
                }
                .onAppear {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                        isAnimated = true
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                onNext()
            }
        }
    }
}

#Preview {
    correctQuestionView(onNext: {})
}
