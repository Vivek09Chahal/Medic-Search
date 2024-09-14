//
//  HowToUseView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 31/08/24.
//

import SwiftUI

struct HowToUseView: View {
    
    @State var howToUseData: String
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                HStack(){
                    Image(systemName: "list.clipboard")
                        .foregroundStyle(.blue)
                    Text("Way to Use")
                        .font(.title2)
                }
                .padding(3)
                Text(howToUseData)
            }
        }
    }
}

#Preview {
    HowToUseView(howToUseData: "Vivek")
}
