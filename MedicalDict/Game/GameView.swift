//
//  GameView.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import SwiftUI

struct GameView: View{
    
    @State var questions: [Game] = loadGameJSONData()
    
    var body : some View{
        HStack{
            ForEach(questions, id: \.self){ question in
                Text("\(question.question)")
            }
        }
    }
}

#Preview {
    GameView()
}
