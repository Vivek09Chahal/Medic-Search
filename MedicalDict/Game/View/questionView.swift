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
                .font(.title)
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
                                    LinearGradient(colors: [
                                        Color(red: 0.3, green: 0.5, blue: 0.9), // Calming but engaging blue
                                        Color(red: 0.4, green: 0.6, blue: 0.95)
                                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
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
        .background(.tertiary)
        .cornerRadius(30)
        .shadow(radius: 10)
        .padding()
    }
    
    private func backgroundColor(for answer: String) -> LinearGradient {
        if answer == selectedAnswer {
            return answer == question.correctAnswer ?
            LinearGradient(colors: [
                Color(red: 0.2, green: 0.7, blue: 0.3), // Success green
                Color(red: 0.3, green: 0.8, blue: 0.4)
            ], startPoint: .topLeading, endPoint: .bottomTrailing) :
            LinearGradient(colors: [
                Color(red: 0.8, green: 0.2, blue: 0.2), // Error red
                Color(red: 0.9, green: 0.3, blue: 0.3)
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        return answer == question.correctAnswer && selectedAnswer != nil ?
        LinearGradient(colors: [
            Color(red: 0.2, green: 0.7, blue: 0.3),
            Color(red: 0.3, green: 0.8, blue: 0.4)
        ], startPoint: .topLeading, endPoint: .bottomTrailing) :
        LinearGradient(colors: [
            Color(red: 0.5, green: 0.5, blue: 0.5), // Neutral gray
            Color(red: 0.6, green: 0.6, blue: 0.6)
        ], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
