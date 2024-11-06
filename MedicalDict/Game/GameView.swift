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
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                
                // Progress, Score, and Timer
                HStack {
                    Text("Question \(currentQuestionIndex + 1) of \(questions.count)")
                        .font(.headline)
                    Spacer()
                    
                    Text("Time: \(Int(timeRemaining)) seconds")
                        .font(.headline)
                    
                    Spacer()
                    Text("Score: \(score)")
                        .font(.headline)
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(30)
                .shadow(radius: 5)
                .padding()
                
                // Time Bar
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 8)
                    
                    Rectangle()
                        .fill(timeRemaining > 7 ? Color.green : (timeRemaining > 3 ? Color.orange : Color.red))
                        .frame(width: max(0, CGFloat(timeRemaining / 10) * geometry.size.width), height: 8)
                        .animation(.linear, value: timeRemaining)
                }
                .cornerRadius(4)
                .padding(.horizontal)
                
                // Question Card
                VStack(alignment: .leading, spacing: 20) {
                    Text(questions[currentQuestionIndex].question)
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    // Answer Options
                    ForEach(Array(questions[currentQuestionIndex].answer.enumerated()), id: \.element) { index, answer in
                        Button(action: {
                            selectAnswer(answer)
                        }) {
                            Text(answer)
                                .font(.title3)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedAnswer == nil ? optionColors[index % optionColors.count] : backgroundColor(for: answer))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .disabled(selectedAnswer != nil)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(30)
                .shadow(radius: 10)
                .padding()
                
                // Next Question Button
                if selectedAnswer != nil {
                    Button("Next Question") {
                        nextQuestion()
                    }
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .frame(maxWidth: min(geometry.size.width, 800))
            .padding()
            .center(in: geometry)
            .alert("Game Complete!", isPresented: $showScore) {
                Button("Play Again", action: resetGame)
            } message: {
                Text("Your final score is \(score) out of \(questions.count)")
            }
        }
        .background(
            Image("doodle")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
        )
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
    
    private func backgroundColor(for answer: String) -> Color {
        guard let selectedAnswer = selectedAnswer else { return Color.blue }
        if selectedAnswer == answer {
            return answer == questions[currentQuestionIndex].correctAnswer ? Color.green : Color.red
        }
        return answer == questions[currentQuestionIndex].correctAnswer ? Color.green : Color.red
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
