//
//  GameView.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import SwiftUI

struct GameView: View {
    @State private var questions: [Game] = loadGameJSONData()
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showScore = false
    @State private var selectedAnswer: String?
    @State private var timeRemaining: Double = 10 // 10 seconds per question
    @State private var timer: Timer?
    @State private var optionColors: [Color] = [.red, .orange, .yellow, .teal]
    //    var meshColor = MeshGradient
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Image("doodle")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.8)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Status Bar
                    HStack(spacing: 20) {
                        // Progress Capsule
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .frame(width: 120, height: 40)
                            .overlay(
                                Text("\(currentQuestionIndex + 1)/\(questions.count)")
                                    .fontWeight(.bold)
                            )
                        
                        // Timer Capsule
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .frame(width: 100, height: 40)
                            .overlay(
                                Text("\(Int(timeRemaining))s")
                                    .fontWeight(.bold)
                                    .foregroundColor(timeRemaining > 3 ? .primary : .red)
                            )
                        
                        // Score Capsule
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .frame(width: 100, height: 40)
                            .overlay(
                                Text("Score: \(score)")
                                    .fontWeight(.bold)
                            )
                    }
                    .padding()
                    
                    // Timer Bar
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .frame(height: 8)
                        
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        timeRemaining > 7 ? .green : (timeRemaining > 3 ? .orange : .red),
                                        timeRemaining > 7 ? .green.opacity(0.7) : (timeRemaining > 3 ? .orange.opacity(0.7) : .red.opacity(0.7))
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: max(0, CGFloat(timeRemaining / 10) * geometry.size.width - 40), height: 8)
                            .animation(.linear, value: timeRemaining)
                    }
                    .padding(.horizontal)
                    
                    // Question Card
                    VStack(alignment: .leading, spacing: 20) {
                        Text(questions[currentQuestionIndex].question)
                            .font(.title2.bold())
                            .padding()
                            .frame(maxWidth: .infinity,alignment: .center)
                            .multilineTextAlignment(.center)
                        
                        // Answer Options
                        ForEach(Array(questions[currentQuestionIndex].answer.enumerated()), id: \.element) { index, answer in
                            Button(action: {
                                withAnimation(.spring()) {
                                    selectAnswer(answer)
                                }
                            }) {
                                Text(answer)
                                    .font(.title3)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        ZStack {
                                            if selectedAnswer == nil {
                                                LinearGradient(colors: [optionColors[index % optionColors.count],
                                                                        optionColors[index % optionColors.count].opacity(0.7)],
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
                    
                    // Next Question Button
                    if selectedAnswer != nil {
                        Button(action: nextQuestion) {
                            Text("Next Question")
                                .font(.title3.bold())
                                .padding(.horizontal, 30)
                                .padding(.vertical, 15)
                                .background(
                                    LinearGradient(colors: [.blue, .blue.opacity(0.8)],
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing)
                                )
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .shadow(radius: 5)
                        }
                        .transition(.scale.combined(with: .opacity))
                    }
                }
                .frame(maxWidth: min(geometry.size.width, 800))
                .padding()
                .center(in: geometry)
            }
        }
        .alert("Game Complete!", isPresented: $showScore) {
            Button("Play Again", action: resetGame)
        } message: {
            Text("Your final score is \(score) out of \(questions.count)")
        }
        .onAppear(perform: startTimer)
        .onDisappear(perform: stopTimer)
    }
    
    private func startTimer() {
        timeRemaining = 10
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 0.1
            } else if selectedAnswer == nil {
                selectAnswer("")  // Time's up, wrong answer
                timeRemaining = 0
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func selectAnswer(_ answer: String) {
        selectedAnswer = answer
        stopTimer()
        if answer == questions[currentQuestionIndex].correctAnswer {
            score += 1
        }
    }
    
    private func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            selectedAnswer = nil
            startTimer()
        } else {
            showScore = true
        }
    }
    
    private func resetGame() {
        questions.shuffle()
        currentQuestionIndex = 0
        score = 0
        selectedAnswer = nil
        startTimer()
    }
    
    private func backgroundColor(for answer: String) -> LinearGradient {
        guard let selectedAnswer = selectedAnswer else {
            return LinearGradient(colors: [.blue, .blue.opacity(0.8)],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
        }
        
        if selectedAnswer == answer {
            return answer == questions[currentQuestionIndex].correctAnswer ?
            LinearGradient(colors: [.green, .green.opacity(0.8)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing) :
            LinearGradient(colors: [.red, .red.opacity(0.8)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        }
        return answer == questions[currentQuestionIndex].correctAnswer ?
        LinearGradient(colors: [.green, .green.opacity(0.8)],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing) :
        LinearGradient(colors: [.gray, .gray.opacity(0.8)],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
}

// Helper extension for centering content
extension View {
    func center(in geometry: GeometryProxy) -> some View {
        self.frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
    }
}

#Preview {
    GameView()
}
