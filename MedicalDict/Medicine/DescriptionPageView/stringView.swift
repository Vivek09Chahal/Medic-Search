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
                    .frame(width: 30, height: 30)
                    .foregroundStyle(color)
                Text(title)
                    .font(.title)
            }
            
            Divider()
            Text("• \(summary)")
                .font(.title2)
        }
        .padding()
    }
}
