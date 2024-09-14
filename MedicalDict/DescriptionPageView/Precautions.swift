//
//  Prediction.swift
//  MedicalDict
//
//  Created by Vivek on 28/08/24.
//

import SwiftUI

struct Precautions: View {
    
    @State var PrecData: [String]
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                ForEach(PrecData, id: \.self) {
                    name in Text("•\(name)")
                        .font(.subheadline)
                }
            }
            .padding(3)
        }
    }
}

#Preview {
    Precautions(PrecData: ["gsdcb", "jdcuy"])
}
