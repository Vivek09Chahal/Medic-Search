//
//  GameView.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import SwiftUI

struct GameView: View{
    
    @State var gameVariables: game
    @State var pickedAnswer: String = ""
    @State var reward: String = ""
    var questNo = 1
    
    var body: some View{
        Text("\(gameVariables.text)")
            .font(.largeTitle)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.blue, lineWidth: 2)
            )
        
        ForEach(gameVariables.answer, id: \.self) { questions in
            Button(action: {
                reward = checkAnswer(question: questions)
            }) {
                Text("•\(questions)")
                    .font(.largeTitle)
                    .background()
            }
        }
        Text("\(reward)")
            .font(.largeTitle)
    }
    
    func checkAnswer(question: String) -> String {
        if question == gameVariables.correctAnswer {
            return "Correct"
        }
        else{
            return "Wrong"
        }
    }
}

#Preview {
    GameView(gameVariables: game(text: "Which vitamin is most abundant in oranges?", answer: ["Vitamin A", "Vitamin B", "Vitamin C", "Vitamin D"], correctAnswer: "Vitamin C"))
}
