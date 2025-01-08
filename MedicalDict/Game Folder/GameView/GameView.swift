//
//  GameView.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import SwiftUI

struct GameView: View {
    @State private var questions: [Game] = loadGameJSONData().shuffled()
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showScore = false
    @State private var selectedAnswer: String?
    @State private var timeRemaining: Double = 10
    @State private var timer: Timer?
    @State private var isGameStarted = false
    @State private var showCorrectView = false
    
    private var currentQuestion: Game {
        questions[currentQuestionIndex]
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                GradientBarsView()
                
                if showCorrectView {
                    correctQuestionView(onNext: {
                        withAnimation(.easeOut(duration: 0.5)) {
                            showCorrectView = false
                        }
                        nextQuestion()
                    })
                    .transition(.scale(scale: 0.3).combined(with: .opacity))
                } else {
                    VStack(spacing: 20) {
                        if isGameStarted {
                            // Status Bar
                            HStack(spacing: 20) {
                                statusCapsule(text: "\(currentQuestionIndex + 1)/\(questions.count)", color: .primary)
                                statusCapsule(text: "\(Int(timeRemaining))s",
                                              color: timeRemaining > 3 ? .primary : .red)
                                statusCapsule(text: "Score: \(score)", color: .secondary)
                            }
                            .padding()
                            
                            // Timer Bar
                            timerProgressBar(timeRemain: timeRemaining, maxWidth: geometry.size.width - 40)
                            
                            // Question View
                            questionView(
                                question: currentQuestion,
                                onAnswerSelected: handleAnswer,
                                selectedAnswer: $selectedAnswer
                            )
                            
                            // Buttons Row
                            HStack(spacing: 15) {
                                // End Button
                                actionButton(
                                    title: "End Game",
                                    gradient: [Color(red: 0.8, green: 0.2, blue: 0.2), Color(red: 0.9, green: 0.3, blue: 0.3)], // Softer red for less anxiety
                                    action: endGame
                                )
                                
                                // Next Question Button
                                actionButton(
                                    title: "Next Question",
                                    gradient: [Color(red: 0.2, green: 0.5, blue: 0.8), Color(red: 0.3, green: 0.6, blue: 0.9)], // Trust-inducing blue
                                    action: nextQuestion
                                )
                                .transition(.scale.combined(with: .opacity))
                            }
                            .padding(.horizontal)
                        } else {
                            // Start Game View
                            VStack(spacing: 20) {
                                Text("Medical Quiz")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle.bold())
                                    .foregroundColor(.primary)
                                
                                actionButton(
                                    title: "Start Game",
                                    gradient: [Color(red: 0.2, green: 0.7, blue: 0.3), Color(red: 0.3, green: 0.8, blue: 0.4)], // Encouraging green
                                    action: startGame
                                )
                            }
                        }
                    }
                    .frame(maxWidth: min(geometry.size.width, 800))
                    .padding()
                }
            }
            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
        .alert("Game Complete!", isPresented: $showScore) {
            Button("Play Again", action: resetGame)
        } message: {
            Text("Your final score is \(score) out of \(questions.count)")
        }
        .onAppear(perform: startTimer)
        .onDisappear(perform: stopTimer)
    }
    
    private func handleAnswer(_ answer: String) {
        selectedAnswer = answer
        stopTimer()
        if answer == currentQuestion.correctAnswer {
            score += 1
            showCorrectView = true
        }
    }
    
    private func startTimer() {
        stopTimer() // Make sure to stop any existing timer first
        timeRemaining = 10
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak timer] _ in
            if timeRemaining > 0 {
                withAnimation {
                    timeRemaining -= 0.1
                }
            } else {
                timer?.invalidate() // Invalidate timer when time's up
                if selectedAnswer == nil {
                    handleAnswer("")
                }
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            stopTimer() // Stop current timer
            currentQuestionIndex += 1
            selectedAnswer = nil
            timeRemaining = 10 // Reset time before starting new timer
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                startTimer() // Start new timer with slight delay
            }
        } else {
            showScore = true
        }
    }
    
    private func startGame() {
        isGameStarted = true
        resetGame()
    }
    
    private func endGame() {
        stopTimer()
        isGameStarted = false  // Set isGameStarted to false to show start game view
        questions.shuffle()    // Shuffle questions for next game
        currentQuestionIndex = 0
        score = 0
        selectedAnswer = nil
    }
    
    private func resetGame() {
        questions.shuffle()
        currentQuestionIndex = 0
        score = 0
        selectedAnswer = nil
        startTimer()
    }
}

#Preview {
    GameView()
}

struct GradientBarsView: View {
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.green.opacity(0.3), .blue.opacity(0.3)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: geometry.size.width * 1.2)
                .position(x: geometry.size.width * 0.2, y: geometry.size.height * 0.2)
                .blur(radius: 5)
            
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.orange.opacity(0.3), .pink.opacity(0.3)],
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading
                    )
                )
                .frame(width: geometry.size.width)
                .position(x: geometry.size.width * 0.8, y: geometry.size.height * 0.8)
                .blur(radius: 5)
        }
    }
}
