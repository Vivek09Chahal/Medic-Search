//
//  Usage.swift
//  MedicalDict
//
//  Created by Vivek on 27/08/24.
//

import SwiftUI

func listView(arrayData: [String], section: String, icon: String, color: Color) -> some View {
    VStack(alignment: .leading) {
        HStack {
            // image
            Image(systemName: icon)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(color)
            
            //title
            Text(section)
                .font(.title3)
        }
        .padding()
        
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(arrayData, id: \.self) { data in
                    Text("• " + data)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.horizontal)
        }
    }
    .padding(7)
    .backGround()
}
