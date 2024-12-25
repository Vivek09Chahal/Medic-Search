//
//  StringView.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import SwiftUI

func stringView(title: String, summary: String, imageString: String) -> some View {
    ScrollView(showsIndicators: false){
        VStack(alignment: .leading){
            HStack(){
                Image(systemName: imageString)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.yellow)
                Text(title)
                    .font(.title2)
                    .padding(5)
            }
            .padding(3)
            Divider()
            Text(summary)
                .font(.title3)
        }
    }
}
