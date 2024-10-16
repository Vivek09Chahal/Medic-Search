//
//  GameView.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import SwiftUI

struct GameView: View{
    
    @State var question: [game] = loadGameJSONData()
    
    var body : some View{
        HStack{
            ForEach(question, id: \.self){ questions in
                Text("\(questions)")
            }
        }
    }
}

#Preview {
    GameView()
}
