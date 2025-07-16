//
//  StringView.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import SwiftUI

func stringView(title: String, summary: String, imageString: String, color: Color) -> some View {
    ScrollView(showsIndicators: false){
        VStack(alignment: .leading){
            HStack(){
                Image(systemName: imageString)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(color)
                Text(title)
                    .font(.title3)
            }
            
            Divider()
            Text(summary)
                .font(.body)
        }
        .padding(7)
    }
    .padding()
    .backGround()
}
