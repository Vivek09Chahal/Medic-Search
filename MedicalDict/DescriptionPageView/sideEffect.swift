//
//  sideEffect.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 03/09/24.

import SwiftUI

struct sideEffect: View {
    
    @State var sideEffectData: [String]
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                HStack(){
                    Image(systemName: "list.clipboard")
                        .foregroundStyle(.blue)
                    Text("Side Effects")
                        .font(.title2)
                }
                .padding(3)
                ForEach(sideEffectData, id: \.self) {
                    name in Text("・\(name)")
                        .font(.subheadline)
                }
            }
            .padding(3)
        }
    }
}

#Preview {
    sideEffect(sideEffectData: ["sdfsf", "sfsdf"])
}
