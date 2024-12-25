//
//  questionView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 12/25/24.
//

import SwiftUI

struct questionView: View {
    let question: Game
    let onAnswerSelected: (String) -> Void
    @Binding var selectedAnswer: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(question.question)
                .font(.title2.bold())
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            
            ForEach(Array(question.answer.enumerated()), id: \.element) { index, answer in
                Button(action: {
                    withAnimation(.spring()) {
                        onAnswerSelected(answer)
                    }
                }) {
                    Text(answer)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                if selectedAnswer == nil {
                                    LinearGradient(colors: [.blue.opacity(0.8), .blue.opacity(0.6)],
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing)
                                } else {
                                    backgroundColor(for: answer)
                                }
                            }
                        )
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .disabled(selectedAnswer != nil)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(30)
        .shadow(radius: 10)
        .padding()
    }
    
    private func backgroundColor(for answer: String) -> LinearGradient {
        if answer == selectedAnswer {
            return answer == question.correctAnswer ?
            LinearGradient(colors: [.green, .green.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing) :
            LinearGradient(colors: [.red, .red.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        return answer == question.correctAnswer && selectedAnswer != nil ?
        LinearGradient(colors: [.green, .green.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing) :
        LinearGradient(colors: [.gray, .gray.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
